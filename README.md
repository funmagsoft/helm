# Helm Charts

Oficjalne Helm Charty dla serwisów Java Spring Boot.

**Helm Repository**: https://funmagsoft.github.io/helm/charts

## 🚀 Quick Start

### Dodaj repozytorium
```bash
helm repo add funmagsoft https://funmagsoft.github.io/helm/charts
helm repo update
```

### Sprawdź dostępne charty
```bash
helm search repo funmagsoft
# NAME                      CHART VERSION   APP VERSION   DESCRIPTION
# funmagsoft/java-service   1.0.0           1.0.0         Generic chart for Java Spring Boot services
```

### Użyj w projekcie (jako dependency)

**Chart.yaml** (w gitops lub lokalnie):
```yaml
apiVersion: v2
name: my-service
version: 0.1.0

dependencies:
  - name: java-service
    version: 1.0.0
    repository: "https://funmagsoft.github.io/helm/charts"
```

**values.yaml**:
```yaml
java-service:
  fullnameOverride: "my-service"
  image:
    repository: "myacr.azurecr.io/my-service"
    tag: "abc1234"
    pullPolicy: IfNotPresent
  service:
    type: ClusterIP
    port: 8080
  resources:
    requests:
      memory: "512Mi"
      cpu: "200m"
    limits:
      memory: "1Gi"
      cpu: "1000m"
```

**Deploy**:
```bash
helm dependency update
helm upgrade --install my-service . -f values.yaml -n dev
```

## 📁 Struktura repozytorium

```
helm/
├── java-service/           # Źródłowy chart
│   ├── Chart.yaml
│   ├── values.yaml
│   └── templates/
└── charts/                 # Publikowane paczki (.tgz)
    └── index.yaml
```

## 📦 Charty

### `java-service` - Generic chart dla Java Spring Boot

Uniwersalny chart dla wszystkich serwisów Java Spring Boot. Wspiera:
- Deployment (z konfigurowalnymi resources, replicas)
- Service (ClusterIP/LoadBalancer)
- ConfigMap (opcjonalnie)
- Ingress (opcjonalnie)

**Szczegóły**: `java-service/README.md`

## 🔄 Publikacja (automatyczna)

Charty są publikowane automatycznie po zmianach w `main`:
1. `.github/workflows/publish-helm.yml` → trigger on push
2. Pakowanie: `helm package java-service/` → `java-service-1.0.0.tgz`
3. Indeksowanie: `helm repo index charts/`
4. Publikacja do GitHub Pages (branch `gh-pages`)

## 🔗 Użycie w GitOps

Wszystkie serwisy używają `java-service` jako dependency:

```
gitops/apps/greeting-service/Chart.yaml
→ dependency: java-service @ 1.0.0
→ values-dev.yaml (nested under java-service:)
```

**Więcej**: https://github.com/funmagsoft/gitops