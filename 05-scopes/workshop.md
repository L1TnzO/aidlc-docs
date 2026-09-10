> [Inicio](README) › [Scopes](05-scopes/README) › **workshop**


# Scope `workshop`

> Standard depth para sesión grupal facilitada con gates obligatorios, pero con test strategy Minimal (el override `testStrategy:`): los tests se demuestran, no se llevan al piso de producción. Corre inception+construction+operation de punta a punta para que los participantes vean el ciclo completo; salta el discovery de ideation que el facilitador prepara a mano.


## Ficha

| Campo | Valor |
|---|---|
| depth por defecto | **Standard** |
| test strategy | **Minimal (override explícito)** |
| review_cap | **advisory** |
| walking skeleton | **on** |
| keywords | workshop, lab, training |
| etapas que ejecuta | **26 de 33** |

**Depth Standard:** 5-8 preguntas por etapa; artefactos completos a detalle moderado. Testing: 5-8 tests por componente (75% unit / 20% integration / 5% E2E).

## Por qué ejecuta y salta esas etapas

Un workshop camina al grupo por la metodología: mantiene visibles las etapas sustantivas de build y operate, y las etapas de ceremonia temprana (market-research, feasibility, scope-definition, team-formation, rough-mockups, approval-handoff) las pre-carga el facilitador.

## Cuándo usarlo y cómo promociona

**Uso:** Formación, labs, demos guiadas de la metodología.

**Promoción:** —

## Rejilla EXECUTE/SKIP por fase

| Fase | Ejecuta | Salta |
|---|---|---|
| **Fase 0 · Inicialización** | 0.1, 0.2, 0.3 | — |
| **Fase 1 · Ideation** | — | 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7 |
| **Fase 2 · Inception** | 2.1, 2.2, 2.3, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9 | — |
| **Fase 3 · Construction** | 3.1, 3.2, 3.3, 3.4, 3.5, 3.6, 3.7 | — |
| **Fase 4 · Operation** | 4.1, 4.2, 4.3, 4.4, 4.5, 4.6, 4.7 | — |

Los números refieren al [índice de 33 etapas](02-etapas/README); la rejilla es la autoritativa compilada del repo.

## Conexiones

- [Matriz de los 11 scopes](05-scopes/README)
- [Depth y test strategy (§8)](04-protocolos/protocolo-stage)
