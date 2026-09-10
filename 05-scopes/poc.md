> [Inicio](README) › [Scopes](05-scopes/README) › **poc**


# Scope `poc`

> Minimal depth para probar viabilidad rápido: capturar el intent, re-ingeniería inversa del código existente, requisitos, generar y testear. Sin ceremonia de diseño, sin operations, sin delivery planning.


## Ficha

| Campo | Valor |
|---|---|
| depth por defecto | **Minimal** |
| test strategy | **(hereda depth: Minimal)** |
| review_cap | **advisory** |
| walking skeleton | **on** |
| keywords | proof of concept, prototype, poc, spike |
| etapas que ejecuta | **8 de 33** |

**Depth Minimal:** 2-4 preguntas por etapa; artefactos mínimos; análisis breve. Testing: modelo Nyquist, 1 test verificable por requisito + happy-path floor por componente (~5-15 tests).

## Por qué ejecuta y salta esas etapas

Un PoC responde una pregunta: si puede funcionar. Conserva solo las etapas que llevan a la respuesta (intent, RE, requirements, code-gen, build&test). El resto se descarta porque un spike es desechable.

## Cuándo usarlo y cómo promociona

**Uso:** Spikes técnicos, validación de factibilidad antes de comprometer presupuesto.

**Promoción:** Si la respuesta es sí: re-scope a feature/mvp y corre el arco completo en el build real.

## Rejilla EXECUTE/SKIP por fase

| Fase | Ejecuta | Salta |
|---|---|---|
| **Fase 0 · Inicialización** | 0.1, 0.2, 0.3 | — |
| **Fase 1 · Ideation** | 1.1 | 1.2, 1.3, 1.4, 1.5, 1.6, 1.7 |
| **Fase 2 · Inception** | 2.1, 2.3 | 2.2, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9 |
| **Fase 3 · Construction** | 3.5, 3.6 | 3.1, 3.2, 3.3, 3.4, 3.7 |
| **Fase 4 · Operation** | — | 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7 |

Los números refieren al [índice de 33 etapas](02-etapas/README); la rejilla es la autoritativa compilada del repo.

## Conexiones

- [Matriz de los 11 scopes](05-scopes/README)
- [Depth y test strategy (§8)](04-protocolos/protocolo-stage)
