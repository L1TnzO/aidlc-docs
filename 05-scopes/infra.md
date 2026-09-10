> [Inicio](README) › [Scopes](05-scopes/README) › **infra**


# Scope `infra`

> Standard depth para cambios de infraestructura: el único scope que se apoya en la mitad trasera del grafo. Salta ideation y las etapas de código de construction; corre practices-discovery, el design pass de NFRs, infrastructure-design, CI y todo el set de deployment+observability en operation.


## Ficha

| Campo | Valor |
|---|---|
| depth por defecto | **Standard** |
| test strategy | **(hereda depth: Standard)** |
| review_cap | **(sin tope)** |
| walking skeleton | **on** |
| keywords | infrastructure, deploy, infra |
| etapas que ejecuta | **13 de 33** |

**Depth Standard:** 5-8 preguntas por etapa; artefactos completos a detalle moderado. Testing: 5-8 tests por componente (75% unit / 20% integration / 5% E2E).

## Por qué ejecuta y salta esas etapas

El trabajo de infra no va de features: ideation, user-stories, domain-design, units-generation y code-generation se saltan. Va de cómo se provisiona y opera el sistema: los stages de operation más los NFR/infra designs que los alimentan. Es el único scope donde reverse-engineering es SKIP (los cambios de infra parten de la topología de despliegue, no del código) y el único no-enterprise/feature que corre la fase operation.

## Cuándo usarlo y cómo promociona

**Uso:** Migraciones de plataforma, nuevos entornos, cambios de topología de red/compute.

**Promoción:** Si el cambio de infra arrastra código de aplicación → feature/mvp.

## Rejilla EXECUTE/SKIP por fase

| Fase | Ejecuta | Salta |
|---|---|---|
| **Fase 0 · Inicialización** | 0.1, 0.2, 0.3 | — |
| **Fase 1 · Ideation** | — | 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7 |
| **Fase 2 · Inception** | 2.2, 2.3 | 2.1, 2.4, 2.5, 2.6, 2.7, 2.8, 2.9 |
| **Fase 3 · Construction** | 3.2, 3.3, 3.4, 3.7 | 3.1, 3.5, 3.6 |
| **Fase 4 · Operation** | 4.1, 4.2, 4.3, 4.4 | 4.5, 4.6, 4.7 |

Los números refieren al [índice de 33 etapas](02-etapas/README); la rejilla es la autoritativa compilada del repo.

## Conexiones

- [Matriz de los 11 scopes](05-scopes/README)
- [Depth y test strategy (§8)](04-protocolos/protocolo-stage)
