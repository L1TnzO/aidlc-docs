> [Inicio](README) › [Scopes](05-scopes/README) › **security-patch**


# Scope `security-patch`

> Minimal depth para responder a una CVE/vulnerabilidad rápido: entender el código (RE), declarar qué debe hacer el parche (requirements), capturar la constraint de seguridad (nfr-requirements, su etapa distintiva), fix y test (code-gen, build&test), y desplegar.


## Ficha

| Campo | Valor |
|---|---|
| depth por defecto | **Minimal** |
| test strategy | **(hereda depth: Minimal)** |
| review_cap | **(sin tope)** |
| walking skeleton | **off** |
| keywords | security, CVE, vulnerability, patch |
| etapas que ejecuta | **10 de 33** |

**Depth Minimal:** 2-4 preguntas por etapa; artefactos mínimos; análisis breve. Testing: modelo Nyquist, 1 test verificable por requisito + happy-path floor por componente (~5-15 tests).

## Por qué ejecuta y salta esas etapas

Un parche de seguridad es urgente, incremental y debe desplegarse: se salta la ceremonia de diseño completa, pero conserva deployment-pipeline/execution, ya que un parche que no despliega no cierra la vulnerabilidad. requirements-analysis corre para dejar declaración auditable de la CVE y sus criterios de remediación.

## Cuándo usarlo y cómo promociona

**Uso:** Respuesta a CVEs, vulnerabilidades reportadas, hardening urgente.

**Promoción:** Si el parche exige rediseño de auth → feature.

## Rejilla EXECUTE/SKIP por fase

| Fase | Ejecuta | Salta |
|---|---|---|
| **Fase 0 · Inicialización** | 0.1, 0.2, 0.3 | — |
| **Fase 1 · Ideation** | — | 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7 |
| **Fase 2 · Inception** | 2.1, 2.3 | 2.2, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9 |
| **Fase 3 · Construction** | 3.2, 3.5, 3.6 | 3.1, 3.3, 3.4, 3.7 |
| **Fase 4 · Operation** | 4.1, 4.3 | 4.2, 4.4, 4.5, 4.6, 4.7 |

Los números refieren al [índice de 33 etapas](02-etapas/README); la rejilla es la autoritativa compilada del repo.

## Conexiones

- [Matriz de los 11 scopes](05-scopes/README)
- [Depth y test strategy (§8)](04-protocolos/protocolo-stage)
