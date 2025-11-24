{{/* Return the name of the chart */}}
{{- define "service.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/* Return the fullname, chartname + release name, max 63 chars */}}
{{- define "service.fullname" -}}
{{- printf "%s-%s" (include "service.name" .) .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
