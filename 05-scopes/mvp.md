> [Inicio](README) › [Scopes](05-scopes/README) › **mvp**


# Scope `mvp`

> Depth Standard recortando frente y cola del workflow para enviar el core rápido: ideation con ceremonia reducida (sin market-research, team-formation ni approval-handoff) y toda la fase operation saltada.


## Ficha

| Campo | Valor |
|---|---|
| depth por defecto | **Standard** |
| test strategy | **(hereda depth)** |
| review_cap | **(sin tope)** |
| walking skeleton | **on** |
| keywords | mvp, minimum viable |
| etapas que ejecuta | **23 de 33** |

**Depth Standard:** 5-8 preguntas por etapa; artefactos completos a detalle moderado. Testing: 5-8 tests por componente (75% unit / 20% integration / 5% E2E).

## Por qué ejecuta y salta esas etapas

Un MVP prueba el producto; no carga todavía el peso de producción. Inception y construction completos corren EXECUTE (un MVP es software real que necesita diseño, código y tests); se salta el discovery que solo paga a escala y las etapas de operation de un producto pasado su primera prueba.

## Cuándo usarlo y cómo promociona

**Uso:** Primeros lanzamientos validables con presupuesto de tiempo mínimo.

**Promoción:** Gradúa a feature o enterprise cuando el MVP pasa la prueba.

## Rejilla EXECUTE/SKIP por fase

| Fase | Ejecuta | Salta |
|---|---|---|
| **Fase 0 · Inicialización** | 0.1, 0.2, 0.3 | — |
| **Fase 1 · Ideation** | 1.1, 1.3, 1.4, 1.6 | 1.2, 1.5, 1.7 |
| **Fase 2 · Inception** | 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9 | — |
| **Fase 3 · Construction** | 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7 | — |
| **Fase 4 · Operation** | — | 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7 |

Los números refieren al [índice de 33 etapas](02-etapas/README); la rejilla es la autoritativa compilada del repo.

## Conexiones

- [Matriz de los 11 scopes](05-scopes/README)
- [Depth y test strategy (§8)](04-protocolos/protocolo-stage)
