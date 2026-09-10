> [Inicio](README) › [Scopes](05-scopes/README) › **refactor**


# Scope `refactor`

> Minimal depth para limpiar código existente sin cambiar comportamiento. Como bugfix salta ideation y la mayoría de operation, pero añade functional-design: un refactor re-estructura, así que el diseño de lo que se preserva importa.


## Ficha

| Campo | Valor |
|---|---|
| depth por defecto | **Minimal** |
| test strategy | **(hereda depth: Minimal)** |
| review_cap | **(sin tope)** |
| walking skeleton | **off** |
| keywords | refactor, clean up, simplify |
| etapas que ejecuta | **10 de 33** |

**Depth Minimal:** 2-4 preguntas por etapa; artefactos mínimos; análisis breve. Testing: modelo Nyquist, 1 test verificable por requisito + happy-path floor por componente (~5-15 tests).

## Por qué ejecuta y salta esas etapas

Refactoring es cambio que preserva estructura sobre un codebase conocido: RE (qué existe), requirements (qué comportamiento preservar), functional-design (la forma objetivo), code-gen + build&test (aplicar y verificar que la suite existente sigue verde). Sin skeleton ceremony (no hay nada que bootstrap).

## Cuándo usarlo y cómo promociona

**Uso:** Mejoras estructurales, eliminación de deuda técnica, simplificación.

**Promoción:** Si el refactor crece a rediseño → feature.

## Rejilla EXECUTE/SKIP por fase

| Fase | Ejecuta | Salta |
|---|---|---|
| **Fase 0 · Inicialización** | 0.1, 0.2, 0.3 | — |
| **Fase 1 · Ideation** | — | 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7 |
| **Fase 2 · Inception** | 2.1, 2.3 | 2.2, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9 |
| **Fase 3 · Construction** | 3.1, 3.5, 3.6 | 3.2, 3.3, 3.4, 3.7 |
| **Fase 4 · Operation** | 4.1, 4.3 | 4.2, 4.4, 4.5, 4.6, 4.7 |

Los números refieren al [índice de 33 etapas](02-etapas/README); la rejilla es la autoritativa compilada del repo.

## Conexiones

- [Matriz de los 11 scopes](05-scopes/README)
- [Depth y test strategy (§8)](04-protocolos/protocolo-stage)
