> [Inicio](README) › [Scopes](05-scopes/README) › **classic**


# Scope `classic`

> El scope implícito por defecto (cuando ni el usuario ni AWS_AIDLC_DEFAULT_SCOPE nombran uno): reproduce la experiencia AI-DLC v1. El ciclo empieza tras Ideation. Salta las 7 etapas de ideation y conserva inception+construction+operation completos.


## Ficha

| Campo | Valor |
|---|---|
| depth por defecto | **Standard** |
| test strategy | **(hereda depth)** |
| review_cap | **advisory** |
| walking skeleton | **on** |
| keywords | (ninguno — selección explícita) |
| etapas que ejecuta | **26 de 33** |

**Depth Standard:** 5-8 preguntas por etapa; artefactos completos a detalle moderado. Testing: 5-8 tests por componente (75% unit / 20% integration / 5% E2E).

## Por qué ejecuta y salta esas etapas

AI-DLC v1 no tenía fase Ideation. classic mantiene solo 8 etapas incondicionales (init 3, requirements, units, delivery-planning, code-gen, build&test); el resto de inception y la cola de operation son CONDITIONAL y se auto-seleccionan del contexto. La test strategy hereda Standard: las expectativas de testing de producción siguen vigentes.

## Cuándo usarlo y cómo promociona

**Uso:** Equipos que ya validan la iniciativa por fuera del framework y quieren entrar directo al diseño.

**Promoción:** Promociona a feature/enterprise si se quiere la fase de ideation completa.

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
