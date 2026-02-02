package openapi

import (
	_ "embed"
	"net/http"
	"sync"
	"text/template"

	"github.com/rs/zerolog"
)

type Server struct {
	Scheme string
	Host   string
}

//go:embed directory.v3.openapi.json
var staticString string

var buildTemplate = sync.OnceValues(func() (*template.Template, error) {
	return template.New("openapi.json").Parse(staticString)
})

// Static string value of the openapi.json file.
func Static() string {
	return staticString
}

// Handler serves the OpenAPI specification file.
func Handler(w http.ResponseWriter, r *http.Request) {
	w.Header().Add("Content-Type", "application/json")

	template, err := buildTemplate()
	if err != nil {
		zerolog.Ctx(r.Context()).Err(err).Msg("failed to build template")
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)

		return
	}

	server := Server{
		Host:   r.Host,
		Scheme: scheme(r),
	}

	err = template.Execute(w, server)
	if err != nil {
		zerolog.Ctx(r.Context()).Err(err).Msg("failed to execute template")
		http.Error(w, "Internal Server Error", http.StatusInternalServerError)

		return
	}
}

func scheme(r *http.Request) string {
	scheme := r.Header.Get("X-Forwarded-Proto")
	if scheme == "" {
		if r.TLS == nil {
			scheme = "http"
		} else {
			scheme = "https"
		}
	}

	return scheme
}
