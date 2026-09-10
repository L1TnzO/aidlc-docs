> [Inicio](README) › [Scopes](05-scopes/README) › **bugfix**


# Scope `bugfix`

> Minimal depth para arreglar un bug específico en un codebase existente: salta toda ideation, corre reverse-engineering para entender el código, requirements para el fix, genera, testea y despliega (retiene deployment-pipeline + deployment-execution: un fix verificado que no llega a producción no cierra el ciclo).


## Ficha

| Campo | Valor |
|---|---|
| depth por defecto | **Minimal** |
| test strategy | **(hereda depth: Minimal)** |
| review_cap | **advisory** |
| walking skeleton | **off** |
| keywords | fix, bug, broken (word-boundary: 'debug' y 'fixture' NO disparan) |
| etapas que ejecuta | **9 de 33** |

**Depth Minimal:** 2-4 preguntas por etapa; artefactos mínimos; análisis breve. Testing: modelo Nyquist, 1 test verificable por requisito + happy-path floor por componente (~5-15 tests).

## Por qué ejecuta y salta esas etapas

Un bugfix es trabajo incremental sobre un sistema conocido: necesita entender qué existe (RE), declarar qué significa 'arreglado' (requirements-analysis) y cambiar+verificar (code-gen, build&test). Uno de los 3 scopes incrementales que saltan la ceremonia walking-skeleton (refactor, security-patch).

## Cuándo usarlo y cómo promociona

**Uso:** Corrección de defectos en producción con ciclo corto y trazable.

**Promoción:** Si el fix revela deuda estructural → refactor; si la causa es de arquitectura → feature/mvp.

## Rejilla EXECUTE/SKIP por fase

| Fase | Ejecuta | Salta |
|---|---|---|
| **Fase 0 · Inicialización** | 0.1, 0.2, 0.3 | — |
| **Fase 1 · Ideation** | — | 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7 |
| **Fase 2 · Inception** | 2.1, 2.3 | 2.2, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9 |
| **Fase 3 · Construction** | 3.5, 3.6 | 3.1, 3.2, 3.3, 3.4, 3.7 |
| **Fase 4 · Operation** | 4.1, 4.3 | 4.2, 4.4, 4.5, 4.6, 4.7 |

Los números refieren al [índice de 33 etapas](02-etapas/README); la rejilla es la autoritativa compilada del repo.

## Conexiones

- [Matriz de los 11 scopes](05-scopes/README)
- [Depth y test strategy (§8)](04-protocolos/protocolo-stage)
