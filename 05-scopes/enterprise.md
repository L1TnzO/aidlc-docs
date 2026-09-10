> [Inicio](README) › [Scopes](05-scopes/README) › **enterprise**


# Scope `enterprise`

> Trabajo regulado con la trazabilidad completa: las 33 etapas del grafo ejecutan. La columna de referencia de la rejilla EXECUTE/SKIP: todos los demás scopes son subconjuntos de este.


## Ficha

| Campo | Valor |
|---|---|
| depth por defecto | **Comprehensive** |
| test strategy | **(hereda depth)** |
| review_cap | **(sin tope)** |
| walking skeleton | **on** |
| keywords | (ninguno — elección deliberada) |
| etapas que ejecuta | **33 de 33** |

**Depth Comprehensive:** 8-12+ preguntas por etapa; artefactos profundos con análisis exhaustivo. Testing: 10-15 tests por componente, todos los tipos según NFRs.

## Por qué ejecuta y salta esas etapas

El trabajo enterprise carga obligaciones de compliance, security review y sign-off que los scopes de etapas saltadas (mvp, poc, bugfix) cambian por velocidad. El costo de una decisión no documentada supera el costo de ejecutar la etapa: se conserva la espina completa, con market-research y team-formation al frente, el design pass completo y la cola de operation al final.

## Cuándo usarlo y cómo promociona

**Uso:** Features regulados, audit trails obligatorios, integraciones críticas de grandes organizaciones.

**Promoción:** Es el scope terminal: no promociona. De aquí se baja a feature si la regulación lo permite.

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
