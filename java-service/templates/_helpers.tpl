{{/* Return the name of the chart */}}
{{- define "service.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/* Return the fullname: either override from values or Release.Name */}}
{{- define "service.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
