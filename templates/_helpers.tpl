{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "zookeeper.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "zookeeper.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Define chart name and version as used by the chart label.
*/}}
{{- define "zookeeper.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Define zookeeper cluster name.
*/}}
{{- define "zookeeper.cluster-name" -}}
{{- .Release.Name | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Define the name of the headless service for zookeeper
*/}}
{{- define "zookeeper.headless-service-name" -}}
{{- printf "%s-%s" .Release.Name "hs" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Define the name of the client service for zookeeper
*/}}
{{- define "zookeeper.client-service-name" -}}
{{- printf "%s-%s" .Release.Name "cs" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Define the name of the pod disruption budget for zookeeper
*/}}
{{- define "zookeeper.pod-disruption-budget-name" -}}
{{- printf "%s-%s" .Release.Name "pdb" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Define the name of the server network policy for zookeeper
*/}}
{{- define "zookeeper.server-networkpolicy-name" -}}
{{- printf "%s-%s" .Release.Name "server-networkpolicy" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Define the name of the server network policy for zookeeper
*/}}
{{- define "zookeeper.client-networkpolicy-name" -}}
{{- printf "%s-%s" .Release.Name "client-networkpolicy" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
  Define the labels that should be applied to all resources in the chart
*/}}
{{- define "zookeeper.labels" -}}
app: {{ template "zookeeper.name" . }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
zkcluster: {{ template "zookeeper.cluster-name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{/*
  Define the labels that should be used by selectors
*/}}
{{- define "zookeeper.selector" -}}
app: {{ template "zookeeper.name" . }}
zkcluster: {{ template "zookeeper.cluster-name" . }}
{{- end -}}
