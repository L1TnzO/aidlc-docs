> [Inicio](README) › [Scopes](05-scopes/README) › **feature**


# Scope `feature`

> El scope de ciclo completo para features nuevas a profundidad práctica. Como enterprise, ejecuta todas las etapas. La diferencia está en la profundidad (Standard vs Comprehensive), no en las etapas que corren.


## Ficha

| Campo | Valor |
|---|---|
| depth por defecto | **Standard** |
| test strategy | **(hereda depth)** |
| review_cap | **(sin tope)** |
| walking skeleton | **on** |
| keywords | (ninguno — fallback implícito de freeform) |
| etapas que ejecuta | **33 de 33** |

**Depth Standard:** 5-8 preguntas por etapa; artefactos completos a detalle moderado. Testing: 5-8 tests por componente (75% unit / 20% integration / 5% E2E).

## Por qué ejecuta y salta esas etapas

Una feature nueva necesita el arco completo: entender el problema (ideation), diseñarlo (inception), construirlo y probarlo (construction) y operarlo (operation). Es el fallback implícito del freeform y del runner `/aidlc-feature`.

## Cuándo usarlo y cómo promociona

**Uso:** Features nuevas de producto con ciclo de vida completo a profundidad práctica.

**Promoción:** Promociona a enterprise si aparece regulación/compliance; baja a mvp si hay que recortar operation.

## Rejilla EXECUTE/SKIP por fase

| Fase | Ejecuta | Salta |
|---|---|---|
| **Fase 0 · Inicialización** | 0.1, 0.2, 0.3 | — |
| **Fase 1 · Ideation** | 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7 | — |
| **Fase 2 · Inception** | 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9 | — |
| **Fase 3 · Construction** | 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7 | — |
| **Fase 4 · Operation** | 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7 | — |

Los números refieren al [índice de 33 etapas](02-etapas/README); la rejilla es la autoritativa compilada del repo.

## Conexiones

- [Matriz de los 11 scopes](05-scopes/README)
- [Depth y test strategy (§8)](04-protocolos/protocolo-stage)
