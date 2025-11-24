# Helm Charts

To repozytorium zawiera oficjalne Helm Charty używane w projektach Funmagsoft.
Charty są automatycznie publikowane jako Helm Repository dostępne pod adresem:

[https://funmagsoft.github.io/helm/charts/index.yaml](https://funmagsoft.github.io/helm/charts/index.yaml)

## Dodawanie repozytorium Helm

Aby skorzystać z chartów w projektach:

```console
helm repo add funmagsoft https://funmagsoft.github.io/helm/charts
helm repo update
```

Sprawdzenie dostępnych chartów:

```console
helm search repo funmagsoft
```

## Instalacja przykładowego serwisu

```console
helm upgrade --install my-service funmagsoft/java-service \
  --set image.repository=myacr.azurecr.io/my-service \
  --set image.tag=latest
```

Lub podając tag obrazu dynamicznie:

```console
helm upgrade --install my-service funmagsoft/java-service \
  --set image.repository=myacr.azurecr.io/my-service \
  --set image.tag=latest
```

## Struktura repozytorium

```
/charts
  └── java-service-<version>.tgz      # Publikowane paczki Helm
index.yaml                            # Helm repository index
.github/workflows/publish-helm.yml    # Publikacja chartów
README.md
```

## Publikacja Chartów (automatyczna)

Charty są publikowane automatycznie po wypuszczeniu nowej wersji (.tgz) w gałęzi main. Workflow:

```console
.github/workflows/publish-helm.yml
```

Generuje:

```console
/charts/*.tgz
index.yaml
```

i publikuje je do gałęzi `gh-pages`.