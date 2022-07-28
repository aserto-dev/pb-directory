//go:build mage
// +build mage

package main

import (
	"fmt"
	"io"
	"os"
	"os/exec"
	"path"
	"strings"

	"github.com/aserto-dev/clui"
	"github.com/aserto-dev/mage-loot/buf"
	"github.com/aserto-dev/mage-loot/deps"
	"github.com/aserto-dev/mage-loot/fsutil"
	"github.com/aserto-dev/mage-loot/testutil"
	"github.com/magefile/mage/mg"
)

var (
	ui = clui.NewUI()
)

func init() {
	os.Setenv("GO_VERSION", "1.17")
	os.Setenv("GOPRIVATE", "github.com/aserto-dev")
}

// install all required dependencies.
func Deps() {
	deps.GetAllDeps()
}

// execute all targets in dependency order.
// deps, build, lint,
func All() error {
	mg.SerialDeps(Deps)

	if err := Clean(); err != nil {
		return err
	}
	if err := Lint(); err != nil {
		return err
	}
	if err := Breaking(); err != nil {
		return err
	}
	if err := Build(); err != nil {
		return err
	}

	return nil
}

// remove all built images files.
func Clean() error {
	return os.RemoveAll("bin")
}

func Lint() error {
	mg.SerialDeps(Login)

	if err := bufLint("proto/buf.yaml", "bin/directory.bin"); err != nil {
		return err
	}

	return nil
}

func Breaking() error {
	mg.SerialDeps(Login)
	bufImage := "buf.build/aserto-dev/directory"

	os.Setenv("BUF_BETA_SUPPRESS_WARNINGS", "1")

	tag, err := buf.GetLatestTag(bufImage)
	if err != nil {
		return err
	}

	if err := bufBreaking("proto", bufImage, tag); err != nil {
		return err
	}

	return nil
}

func Build() error {
	mg.SerialDeps(Login)

	if err := bufModUpdate("proto"); err != nil {
		return err
	}

	if err := bufBuild("bin/directory.bin"); err != nil {
		return err
	}

	return nil
}

func Push() error {
	mg.SerialDeps(Login)

	releaseVersion, _ := getReleaseVersion()
	fmt.Println("tag", releaseVersion)

	if err := bufBuild("bin/directory.bin"); err != nil {
		return err
	}

	if err := bufPush("proto", releaseVersion); err != nil {
		return err
	}

	return nil
}

func Login() error {
	if err := bufLogin(); err != nil {
		return err
	}
	return nil
}

func bufBreaking(dir, image string, tag buf.Tag) error {
	return buf.Run(
		buf.AddArg("breaking"),
		buf.AddArg("--against"),
		buf.AddArg(fmt.Sprintf("%s:%s", image, tag.Name)),
		buf.AddArg(dir),
	)
}

func bufPush(dir, version string) error {
	if version == "" {
		return buf.Run(
			buf.AddArg("push"),
			buf.AddArg(fmt.Sprintf("%s#format=dir", dir)),
		)
	}

	return buf.Run(
		buf.AddArg("push"),
		buf.AddArg(fmt.Sprintf("%s#format=dir", dir)),
		buf.AddArg("--tag"),
		buf.AddArg(version),
	)
}

func bufGenerate() error {
	return buf.Run(
		buf.AddArg("generate"),
	)
}

func bufLint(config, bin string) error {
	return buf.Run(
		buf.AddArg("lint"),
		buf.AddArg("--config"),
		buf.AddArg(config),
		buf.AddArg(bin),
	)
}

func bufBuild(bin string) error {
	fsutil.EnsureDir(path.Dir(bin))

	return buf.Run(
		buf.AddArg("build"),
		buf.AddArg("--output"),
		buf.AddArg(bin),
	)
}

func bufModUpdate(dir string) error {
	return buf.Run(
		buf.AddArg("mod"),
		buf.AddArg("update"),
		buf.AddArg(dir),
	)
}

func bufLogin() error {
	bufToken := testutil.VaultValue("buf.build", "ASERTO_BUF_TOKEN")
	bufUser := testutil.VaultValue("buf.build", "ASERTO_BUF_USER")

	args := []string{"registry", "login", "--username", bufUser, "--token-stdin"}

	cmd := exec.Command(deps.GoBinPath("buf"), args...)
	stdin, err := cmd.StdinPipe()
	if err != nil {
		return err
	}

	go func() {
		defer stdin.Close()
		io.WriteString(stdin, bufToken)
	}()

	out, err := cmd.CombinedOutput()
	if err != nil {
		return err
	}

	ui.Normal().
		Msg(">>> executing buf " + strings.Join(args, " "))
	ui.Normal().
		Msg(string(out))

	return err
}

func getReleaseVersion() (string, error) {
	svu := deps.GoDepOutput("svu")

	out, err := svu()
	if err != nil {
		fmt.Println(out)
		return "", err
	}
	return out, nil
}
