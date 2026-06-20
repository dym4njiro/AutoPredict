Feature: US-01 - Alerta temprana de desgaste

  Como taxista,
  Quiero recibir una alerta de desgaste antes de que una pieza falle,
  Para prevenir paradas de emergencia en horario laboral.


  Scenario Outline: Mostrar alerta crítica por desgaste

    Given que la aplicación está conectada a la telemetría del vehículo
    And el componente <componente> está siendo monitoreado
    When el desgaste supera el <porcentaje_desgaste>
    Then el sistema muestra una alerta crítica roja en el panel principal

    Example: INPUT

      | componente | porcentaje_desgaste |
      | frenos     | 80%                 |
      | embrague   | 90%                 |
      | llantas    | 76%                 |

    Example: OUTPUT

      | alerta_generada      |
      | alerta crítica roja  |
      | alerta crítica roja  |
      | alerta crítica roja  |


  Scenario Outline: Mantener estado normal del componente

    Given que la aplicación está conectada a la telemetría del vehículo
    And el componente <componente> está siendo monitoreado
    When el desgaste es menor a <porcentaje_desgaste>
    Then el sistema mantiene el estado normal

    Example: INPUT

      | componente | porcentaje_desgaste |
      | frenos     | 40%                 |
      | embrague   | 50%                 |
      | llantas    | 60%                 |

    Example: OUTPUT

      | estado |
      | normal |
      | normal |
      | normal |

Feature: US-02 - Alerta preventiva por kilometraje

  Como conductor de aplicativo,
  Quiero que la app calcule mi kilometraje diario,
  Para no exceder el límite de mantenimiento.


  Scenario Outline: Enviar recordatorio de mantenimiento

    Given que la aplicación monitorea el kilometraje del vehículo
    When faltan <km_restantes> kilómetros para el mantenimiento
    Then el sistema envía una notificación preventiva

    Example: INPUT

      | vehiculo       | km_restantes |
      | Toyota Corolla | 500          |
      | Honda Civic    | 450          |
      | Kia Rio        | 500          |

    Example: OUTPUT

      | notificacion |
      | mantenimiento próximo |
      | mantenimiento próximo |
      | mantenimiento próximo |


  Scenario Outline: No generar recordatorio

    Given que la aplicación monitorea el kilometraje del vehículo
    When faltan más de <km_restantes> kilómetros para el mantenimiento
    Then el sistema no genera alertas

    Example: INPUT

      | vehiculo       | km_restantes |
      | Toyota Corolla | 1500         |
      | Honda Civic    | 2000         |
      | Kia Rio        | 1800         |

    Example: OUTPUT

      | resultado |
      | sin alerta |
      | sin alerta |
      | sin alerta |

Feature: US-03 - Monitoreo de temperatura en tiempo real

  Como taxista,
  Quiero visualizar la temperatura del motor en tiempo real,
  Para evitar sobrecalentamientos.


  Scenario Outline: Temperatura supera el límite seguro

    Given que el escáner OBD-II transmite datos
    When la temperatura alcanza <temperatura>
    Then el indicador cambia a rojo y se activa una alerta sonora

    Example: INPUT

      | vehiculo       | temperatura |
      | Toyota Corolla | 106°C       |
      | Honda Civic    | 110°C       |
      | Nissan Versa   | 108°C       |

    Example: OUTPUT

      | accion |
      | alerta sonora y panel rojo |
      | alerta sonora y panel rojo |
      | alerta sonora y panel rojo |


  Scenario Outline: Temperatura dentro del rango seguro

    Given que el escáner OBD-II transmite datos
    When la temperatura alcanza <temperatura>
    Then el indicador permanece en estado normal

    Example: INPUT

      | vehiculo       | temperatura |
      | Toyota Corolla | 85°C        |
      | Honda Civic    | 90°C        |
      | Nissan Versa   | 95°C        |

    Example: OUTPUT

      | estado |
      | normal |
      | normal |
      | normal |

Feature: US-04 - Predicción de falla por patrones históricos

  Como conductor particular,
  Quiero detectar patrones repetitivos de desgaste,
  Para anticiparme a futuras fallas.


  Scenario Outline: Detectar patrón histórico

    Given que existen al menos dos reparaciones previas
    When los datos actuales coinciden con el patrón histórico
    Then la aplicación muestra una advertencia predictiva

    Example: INPUT

      | componente   | reparaciones_previas |
      | alternador   | 2 |
      | embrague     | 3 |
      | bomba agua   | 2 |

    Example: OUTPUT

      | resultado |
      | advertencia predictiva |
      | advertencia predictiva |
      | advertencia predictiva |


  Scenario Outline: No detectar patrón histórico

    Given que existen registros limitados
    When los datos actuales no coinciden con patrones previos
    Then no se genera advertencia

    Example: INPUT

      | componente | reparaciones_previas |
      | alternador | 1 |
      | embrague   | 1 |
      | batería    | 0 |

    Example: OUTPUT

      | resultado |
      | sin advertencia |
      | sin advertencia |
      | sin advertencia |

Feature: US-05 - Resumen semanal del estado vehicular

  Como conductor,
  Quiero recibir un resumen semanal del vehículo,
  Para monitorear su condición general.


  Scenario Outline: Enviar resumen semanal

    Given que el vehículo generó datos durante la semana
    When llega el domingo por la noche
    Then el sistema envía un reporte de salud vehicular

    Example: INPUT

      | vehiculo |
      | Toyota Corolla |
      | Honda Civic |
      | Ford Focus |

    Example: OUTPUT

      | reporte |
      | resumen semanal enviado |
      | resumen semanal enviado |
      | resumen semanal enviado |


  Scenario Outline: No generar resumen sin datos

    Given que el vehículo no registró actividad
    When llega el domingo por la noche
    Then el sistema no genera reporte

    Example: INPUT

      | vehiculo |
      | Toyota Corolla |
      | Honda Civic |
      | Ford Focus |

    Example: OUTPUT

      | resultado |
      | sin reporte |
      | sin reporte |
      | sin reporte |

Feature: US-06 - Traducción de códigos de error

  Como conductor particular,
  Quiero visualizar los códigos de error en lenguaje sencillo,
  Para comprender la falla sin depender de un mecánico.


  Scenario Outline: Traducir código OBD-II detectado

    Given que el sistema detecta un código OBD-II
    When el código <codigo> es procesado
    Then el sistema muestra una explicación comprensible

    Example: INPUT

      | codigo |
      | P0300  |
      | P0420  |
      | P0171  |

    Example: OUTPUT

      | descripcion                        |
      | fallo de encendido múltiple        |
      | baja eficiencia del catalizador    |
      | mezcla pobre de combustible        |


  Scenario Outline: Código no registrado en la base de datos

    Given que el sistema detecta un código OBD-II
    When el código <codigo> no existe en la base de conocimiento
    Then el sistema informa que la descripción no está disponible

    Example: INPUT

      | codigo |
      | X9999  |
      | Z1234  |
      | A0000  |

    Example: OUTPUT

      | resultado                 |
      | descripción no disponible |
      | descripción no disponible |
      | descripción no disponible |


Feature: US-07 - Exportación de diagnóstico a PDF

  Como conductor particular,
  Quiero descargar mi diagnóstico en formato PDF,
  Para compartirlo con un mecánico.


  Scenario Outline: Generar archivo PDF correctamente

    Given que el usuario visualiza un diagnóstico generado
    When presiona el botón "Descargar PDF"
    Then el sistema genera un documento PDF compartible

    Example: INPUT

      | reporte                |
      | diagnóstico motor      |
      | diagnóstico frenos     |
      | diagnóstico transmisión|

    Example: OUTPUT

      | resultado     |
      | PDF generado  |
      | PDF generado  |
      | PDF generado  |


  Scenario Outline: Intentar exportar sin diagnóstico

    Given que no existe un diagnóstico generado
    When el usuario presiona "Descargar PDF"
    Then el sistema muestra un mensaje de error

    Example: INPUT

      | estado_reporte |
      | vacío          |
      | inexistente    |
      | nulo           |

    Example: OUTPUT

      | resultado                 |
      | reporte no disponible     |
      | reporte no disponible     |
      | reporte no disponible     |


Feature: US-08 - Detección automática de severidad

  Como conductor,
  Quiero que la aplicación clasifique la gravedad de una falla,
  Para saber si debo detenerme inmediatamente.


  Scenario Outline: Clasificar severidad de un código

    Given que se detecta un código de diagnóstico
    When el sistema analiza el código <codigo>
    Then asigna un nivel de severidad

    Example: INPUT

      | codigo |
      | P0300  |
      | P0420  |
      | P0118  |

    Example: OUTPUT

      | severidad |
      | Alta      |
      | Media     |
      | Crítica   |


  Scenario Outline: Mostrar nivel de riesgo al usuario

    Given que la severidad fue determinada
    When el usuario consulta el diagnóstico
    Then el sistema muestra el nivel de riesgo correspondiente

    Example: INPUT

      | severidad |
      | Baja      |
      | Media     |
      | Crítica   |

    Example: OUTPUT

      | indicador_visual |
      | verde            |
      | amarillo         |
      | rojo             |


Feature: US-09 - Historial de códigos detectados

  Como conductor particular,
  Quiero consultar los códigos detectados anteriormente,
  Para identificar fallas recurrentes.


  Scenario Outline: Mostrar historial de diagnósticos

    Given que existen diagnósticos almacenados
    When el usuario accede al historial
    Then el sistema muestra todos los códigos registrados

    Example: INPUT

      | vehiculo       |
      | Toyota Corolla |
      | Honda Civic    |
      | Kia Rio        |

    Example: OUTPUT

      | resultado            |
      | historial mostrado   |
      | historial mostrado   |
      | historial mostrado   |


  Scenario Outline: Historial vacío

    Given que no existen diagnósticos previos
    When el usuario accede al historial
    Then el sistema informa que no hay registros

    Example: INPUT

      | vehiculo       |
      | Toyota Corolla |
      | Honda Civic    |
      | Kia Rio        |

    Example: OUTPUT

      | resultado          |
      | sin registros      |
      | sin registros      |
      | sin registros      |

Feature: US-10 - Recomendación automática de taller según código

  Como conductor,
  Quiero recibir sugerencias de talleres especializados,
  Para resolver la falla más rápido.


  Scenario Outline: Recomendar talleres especializados

    Given que el código OBD-II ya fue interpretado
    When el usuario selecciona "Buscar solución"
    Then el sistema muestra talleres especializados cercanos

    Example: INPUT

      | codigo |
      | P0300  |
      | P0420  |
      | P0171  |

    Example: OUTPUT

      | resultado            |
      | talleres sugeridos   |
      | talleres sugeridos   |
      | talleres sugeridos   |


  Scenario Outline: No encontrar talleres compatibles

    Given que el código OBD-II fue interpretado
    When no existen talleres especializados disponibles
    Then el sistema informa que no hay resultados cercanos

    Example: INPUT

      | codigo |
      | X9999  |
      | Z1234  |
      | A0000  |

    Example: OUTPUT

      | resultado                    |
      | sin talleres disponibles     |
      | sin talleres disponibles     |
      | sin talleres disponibles     |
    
Feature: US-11 - Recepción de prediagnóstico

  Como dueño de un taller,
  Quiero recibir el reporte de fallas antes de que llegue el cliente,
  Para agilizar la revisión física y preparar los repuestos.


  Scenario Outline: Visualizar prediagnóstico del cliente

    Given que un cliente reservó un servicio con diagnóstico adjunto
    When el mecánico abre los detalles de la cita
    Then el sistema muestra la información del prediagnóstico

    Example: INPUT

      | cliente | diagnostico        |
      | Juan    | falla de frenos    |
      | Pedro   | falla de motor     |
      | Ana     | falla eléctrica    |

    Example: OUTPUT

      | resultado                  |
      | prediagnóstico mostrado    |
      | prediagnóstico mostrado    |
      | prediagnóstico mostrado    |


  Scenario Outline: Cita sin diagnóstico adjunto

    Given que un cliente reservó un servicio
    When el mecánico abre los detalles de la cita
    And no existe un diagnóstico adjunto
    Then el sistema informa que no hay prediagnóstico disponible

    Example: INPUT

      | cliente |
      | Juan    |
      | Pedro   |
      | Ana     |

    Example: OUTPUT

      | resultado                    |
      | diagnóstico no disponible    |
      | diagnóstico no disponible    |
      | diagnóstico no disponible    |

Feature: US-12 - Asignación de mecánico por especialidad

  Como dueño del taller,
  Quiero asignar vehículos a mecánicos especializados,
  Para optimizar los tiempos de reparación.


  Scenario Outline: Asignar técnico especializado

    Given que un vehículo ingresó a la cola del taller
    When el dueño selecciona al mecánico <mecanico>
    Then el sistema asigna el trabajo y envía una notificación

    Example: INPUT

      | mecanico      |
      | especialista motor |
      | especialista frenos |
      | especialista eléctrico |

    Example: OUTPUT

      | resultado          |
      | técnico asignado   |
      | técnico asignado   |
      | técnico asignado   |


  Scenario Outline: Intentar asignar un técnico no disponible

    Given que un vehículo ingresó a la cola del taller
    When el dueño selecciona un mecánico ocupado
    Then el sistema impide la asignación

    Example: INPUT

      | estado_mecanico |
      | ocupado         |
      | ocupado         |
      | ocupado         |

    Example: OUTPUT

      | resultado             |
      | técnico no disponible |
      | técnico no disponible |
      | técnico no disponible |

Feature: US-13 - Actualización automática de estado del servicio

  Como cliente,
  Quiero visualizar el estado actual de mi vehículo,
  Para conocer el progreso de la reparación.


  Scenario Outline: Actualizar estado del servicio

    Given que el vehículo está siendo reparado
    When el mecánico cambia el estado a <estado>
    Then el cliente visualiza el cambio inmediatamente

    Example: INPUT

      | estado |
      | Diagnóstico |
      | Reparación |
      | Finalizado |

    Example: OUTPUT

      | resultado           |
      | estado actualizado  |
      | estado actualizado  |
      | estado actualizado  |


  Scenario Outline: Estado sin modificaciones

    Given que el vehículo está siendo reparado
    When el mecánico no realiza cambios
    Then el cliente continúa visualizando el estado actual

    Example: INPUT

      | estado_actual |
      | Diagnóstico   |
      | Reparación    |
      | Espera        |

    Example: OUTPUT

      | resultado                |
      | sin cambios registrados  |
      | sin cambios registrados  |
      | sin cambios registrados  |

Feature: US-14 - Notificación de ingreso al taller

  Como conductor,
  Quiero recibir confirmación cuando mi vehículo sea recepcionado,
  Para tener evidencia del inicio del servicio.


  Scenario Outline: Enviar notificación de ingreso

    Given que el mecánico recibe el vehículo
    When confirma la recepción
    Then el sistema envía una notificación al conductor

    Example: INPUT

      | vehiculo |
      | Toyota   |
      | Hyundai  |
      | Kia      |

    Example: OUTPUT

      | resultado              |
      | notificación enviada   |
      | notificación enviada   |
      | notificación enviada   |


  Scenario Outline: Recepción no confirmada

    Given que el vehículo llegó al taller
    When el mecánico no confirma la recepción
    Then el sistema no envía ninguna notificación

    Example: INPUT

      | vehiculo |
      | Toyota   |
      | Hyundai  |
      | Kia      |

    Example: OUTPUT

      | resultado      |
      | sin notificar  |
      | sin notificar  |
      | sin notificar  |

Feature: US-15 - Cola digital de atención

  Como dueño de taller,
  Quiero visualizar una cola ordenada de vehículos pendientes,
  Para priorizar el flujo de trabajo.


  Scenario Outline: Mostrar cola de atención ordenada

    Given que existen vehículos programados
    When el dueño abre el panel principal
    Then el sistema muestra la cola ordenada por hora de llegada

    Example: INPUT

      | vehiculo | hora_ingreso |
      | Auto A   | 08:00        |
      | Auto B   | 08:30        |
      | Auto C   | 09:00        |

    Example: OUTPUT

      | posicion |
      | 1         |
      | 2         |
      | 3         |


  Scenario Outline: Cola sin vehículos pendientes

    Given que no existen vehículos programados
    When el dueño abre el panel principal
    Then el sistema informa que no hay vehículos en espera

    Example: INPUT

      | vehiculos_pendientes |
      | 0 |
      | 0 |
      | 0 |

    Example: OUTPUT

      | resultado            |
      | cola vacía           |
      | cola vacía           |
      | cola vacía           |

Feature: US-16 - Registro de bitácora de servicios

  Como conductor particular,
  Quiero acceder a una bitácora digital de mis reparaciones,
  Para mantener un historial comprobable de mi vehículo.


  Scenario Outline: Registrar servicio completado

    Given que una reparación ha sido finalizada
    When el mecánico marca el servicio como "Completado"
    Then el sistema agrega automáticamente el registro al historial clínico

    Example: INPUT

      | servicio              |
      | cambio de aceite      |
      | cambio de frenos      |
      | alineamiento          |

    Example: OUTPUT

      | resultado                |
      | registro agregado        |
      | registro agregado        |
      | registro agregado        |


  Scenario Outline: Servicio aún no finalizado

    Given que existe una reparación en proceso
    When el mecánico no marca el servicio como completado
    Then el sistema no registra información en el historial

    Example: INPUT

      | estado_servicio |
      | En proceso      |
      | Pendiente       |
      | Diagnóstico     |

    Example: OUTPUT

      | resultado              |
      | sin registrar          |
      | sin registrar          |
      | sin registrar          |

Feature: US-17 - Filtro de historial por tipo de repuesto

  Como conductor,
  Quiero filtrar mi historial clínico,
  Para visualizar cambios realizados a un repuesto específico.


  Scenario Outline: Filtrar historial correctamente

    Given que el usuario se encuentra en el historial clínico
    When busca el repuesto <repuesto>
    Then el sistema muestra únicamente los registros relacionados

    Example: INPUT

      | repuesto |
      | frenos   |
      | batería  |
      | llantas  |

    Example: OUTPUT

      | resultado                 |
      | registros filtrados       |
      | registros filtrados       |
      | registros filtrados       |


  Scenario Outline: Repuesto sin registros asociados

    Given que el usuario se encuentra en el historial clínico
    When busca un repuesto inexistente
    Then el sistema no muestra coincidencias

    Example: INPUT

      | repuesto        |
      | turbo híbrido   |
      | sensor lunar    |
      | pieza XYZ       |

    Example: OUTPUT

      | resultado            |
      | sin coincidencias    |
      | sin coincidencias    |
      | sin coincidencias    |

Feature: US-18 - Comparación de mantenimientos previos

  Como conductor,
  Quiero comparar servicios pasados,
  Para evaluar frecuencia y costos.


  Scenario Outline: Comparar dos mantenimientos

    Given que existen múltiples registros de mantenimiento
    When el usuario selecciona dos registros
    Then el sistema muestra una comparación lado a lado

    Example: INPUT

      | mantenimiento_1 | mantenimiento_2 |
      | frenos 2024     | frenos 2025     |
      | aceite 2024     | aceite 2025     |
      | llantas 2024    | llantas 2025    |

    Example: OUTPUT

      | resultado              |
      | comparación mostrada   |
      | comparación mostrada   |
      | comparación mostrada   |


  Scenario Outline: Selección insuficiente de registros

    Given que existen múltiples registros
    When el usuario selecciona menos de dos registros
    Then el sistema solicita completar la selección

    Example: INPUT

      | registros_seleccionados |
      | 1                       |
      | 0                       |
      | 1                       |

    Example: OUTPUT

      | resultado                   |
      | selección insuficiente      |
      | selección insuficiente      |
      | selección insuficiente      |

Feature: US-19 - Exportación completa del historial

  Como usuario,
  Quiero exportar todo mi historial vehicular,
  Para compartirlo al vender mi vehículo.


  Scenario Outline: Exportar historial completo

    Given que existe historial vehicular registrado
    When el usuario selecciona la opción exportar
    Then el sistema genera un documento PDF

    Example: INPUT

      | historial |
      | disponible |
      | disponible |
      | disponible |

    Example: OUTPUT

      | resultado     |
      | PDF generado  |
      | PDF generado  |
      | PDF generado  |


  Scenario Outline: Intentar exportar historial vacío

    Given que no existen registros en el historial
    When el usuario selecciona exportar
    Then el sistema informa que no hay datos disponibles

    Example: INPUT

      | historial |
      | vacío     |
      | vacío     |
      | vacío     |

    Example: OUTPUT

      | resultado              |
      | historial vacío        |
      | historial vacío        |
      | historial vacío        |

Feature: US-20 - Indicador de frecuencia de reparaciones

  Como conductor,
  Quiero visualizar qué componentes fallan con mayor frecuencia,
  Para tomar mejores decisiones preventivas.


  Scenario Outline: Mostrar análisis de frecuencia

    Given que existen suficientes registros históricos
    When el usuario accede al panel analítico
    Then el sistema muestra gráficos de frecuencia de reparaciones

    Example: INPUT

      | componente |
      | frenos     |
      | batería    |
      | embrague   |

    Example: OUTPUT

      | resultado                 |
      | gráfico generado          |
      | gráfico generado          |
      | gráfico generado          |


  Scenario Outline: Información insuficiente para análisis

    Given que existen pocos registros históricos
    When el usuario accede al panel analítico
    Then el sistema informa que no puede generar estadísticas

    Example: INPUT

      | cantidad_registros |
      | 0                  |
      | 1                  |
      | 2                  |

    Example: OUTPUT

      | resultado                      |
      | datos insuficientes            |
      | datos insuficientes            |
      | datos insuficientes            |

Feature: US-21 - Emisión de cotización transparente

  Como dueño de taller,
  Quiero enviar una cotización detallada a la app del cliente,
  Para que apruebe el presupuesto y mejorar su confianza.


  Scenario Outline: Enviar cotización al cliente

    Given que el mecánico registró los costos de repuestos y mano de obra
    When presiona el botón "Enviar Cotización"
    Then el cliente recibe una cotización interactiva

    Example: INPUT

      | repuestos | mano_obra |
      | S/300     | S/150     |
      | S/500     | S/200     |
      | S/250     | S/100     |

    Example: OUTPUT

      | resultado            |
      | cotización enviada   |
      | cotización enviada   |
      | cotización enviada   |


  Scenario Outline: Intentar enviar cotización incompleta

    Given que el mecánico está generando una cotización
    When faltan datos de costos
    Then el sistema solicita completar la información

    Example: INPUT

      | repuestos | mano_obra |
      | vacío     | S/150     |
      | S/500     | vacío     |
      | vacío     | vacío     |

    Example: OUTPUT

      | resultado          |
      | datos incompletos  |
      | datos incompletos  |
      | datos incompletos  |

Feature: US-22 - Modificación de cotización rechazada

  Como dueño de taller,
  Quiero editar y reenviar una cotización rechazada,
  Para ofrecer una alternativa más económica.


  Scenario Outline: Reenviar cotización modificada

    Given que una cotización fue rechazada por el cliente
    When el mecánico modifica la lista de repuestos
    Then la cotización cambia a estado pendiente

    Example: INPUT

      | tipo_repuesto |
      | genérico      |
      | alternativo   |
      | económico     |

    Example: OUTPUT

      | resultado              |
      | cotización reenviada   |
      | cotización reenviada   |
      | cotización reenviada   |


  Scenario Outline: Modificar cotización no rechazada

    Given que la cotización no fue rechazada
    When el mecánico intenta actualizarla
    Then el sistema bloquea la operación

    Example: INPUT

      | estado     |
      | Pendiente  |
      | Aprobada   |
      | En revisión|

    Example: OUTPUT

      | resultado             |
      | operación denegada    |
      | operación denegada    |
      | operación denegada    |

Feature: US-23 - Selección de opciones de repuestos

  Como conductor particular,
  Quiero visualizar opciones de repuestos originales y alternativos,
  Para elegir la que mejor se ajuste a mi presupuesto.


  Scenario Outline: Seleccionar repuestos alternativos

    Given que el usuario revisa una cotización pendiente
    When selecciona "Repuestos Alternativos"
    Then el sistema recalcula el costo total

    Example: INPUT

      | precio_original |
      | S/1200          |
      | S/900           |
      | S/1500          |

    Example: OUTPUT

      | precio_actualizado |
      | S/850              |
      | S/650              |
      | S/1100             |


  Scenario Outline: Mantener repuestos originales

    Given que el usuario revisa una cotización pendiente
    When mantiene seleccionada la opción original
    Then el precio permanece igual

    Example: INPUT

      | precio_original |
      | S/1200          |
      | S/900           |
      | S/1500          |

    Example: OUTPUT

      | precio_final |
      | S/1200       |
      | S/900        |
      | S/1500       |

Feature: US-24 - Historial de cotizaciones rechazadas

  Como taller,
  Quiero consultar cotizaciones rechazadas,
  Para analizar oportunidades perdidas.


  Scenario Outline: Mostrar cotizaciones rechazadas

    Given que existen cotizaciones rechazadas registradas
    When el dueño abre el historial
    Then el sistema muestra únicamente las rechazadas

    Example: INPUT

      | estado     |
      | Rechazada  |
      | Rechazada  |
      | Rechazada  |

    Example: OUTPUT

      | resultado |
      | listada   |
      | listada   |
      | listada   |


  Scenario Outline: No existen cotizaciones rechazadas

    Given que no existen cotizaciones rechazadas
    When el dueño abre el historial
    Then el sistema informa que no hay registros

    Example: INPUT

      | estado    |
      | Aprobada  |
      | Pendiente |
      | Aprobada  |

    Example: OUTPUT

      | resultado       |
      | sin registros   |
      | sin registros   |
      | sin registros   |

Feature: US-25 - Notificación de vencimiento de cotización

  Como conductor,
  Quiero recibir aviso antes del vencimiento de una cotización,
  Para decidir a tiempo.


  Scenario Outline: Enviar recordatorio de vencimiento

    Given que existe una cotización pendiente
    When faltan menos de 24 horas para su vencimiento
    Then el sistema envía un recordatorio

    Example: INPUT

      | horas_restantes |
      | 24              |
      | 12              |
      | 1               |

    Example: OUTPUT

      | resultado             |
      | recordatorio enviado  |
      | recordatorio enviado  |
      | recordatorio enviado  |


  Scenario Outline: No enviar recordatorio

    Given que existe una cotización pendiente
    When faltan más de 24 horas para su vencimiento
    Then el sistema no genera notificaciones

    Example: INPUT

      | horas_restantes |
      | 48              |
      | 72              |
      | 96              |

    Example: OUTPUT

      | resultado        |
      | sin recordatorio |
      | sin recordatorio |
      | sin recordatorio |

Feature: US-26 - Reserva en horas de baja demanda

  Como conductor de aplicativo,
  Quiero agendar citas en horarios de baja afluencia,
  Para no perder mis horas pico de ingresos en la calle.


  Scenario Outline: Mostrar horarios de baja demanda

    Given que el usuario abre el calendario de reservas
    When selecciona una fecha disponible
    Then el sistema resalta visualmente los horarios con menor demanda histórica

    Example: INPUT

      | fecha       |
      | 15/06/2026  |
      | 16/06/2026  |
      | 17/06/2026  |

    Example: OUTPUT

      | resultado                           |
      | horarios óptimos resaltados         |
      | horarios óptimos resaltados         |
      | horarios óptimos resaltados         |


  Scenario Outline: No existen datos históricos suficientes

    Given que el usuario abre el calendario de reservas
    When no existen datos históricos para la fecha seleccionada
    Then el sistema muestra los horarios disponibles sin recomendaciones

    Example: INPUT

      | fecha       |
      | 25/12/2026  |
      | 01/01/2027  |
      | 02/01/2027  |

    Example: OUTPUT

      | resultado                     |
      | sin recomendación disponible  |
      | sin recomendación disponible  |
      | sin recomendación disponible  |

Feature: US-27 - Reprogramación rápida de cita

  Como taxista,
  Quiero poder cancelar o reprogramar mi cita desde la app,
  Para evitar llamadas telefónicas si surge un viaje imprevisto.


  Scenario Outline: Reprogramar una cita existente

    Given que el usuario visualiza su tarjeta "Próxima Cita"
    When presiona "Reprogramar" y selecciona una nueva fecha y hora disponible
    Then el sistema actualiza la reserva y notifica al taller y al usuario

    Example: INPUT

      | nueva_fecha | nueva_hora |
      | 20/06/2026  | 09:00      |
      | 21/06/2026  | 11:00      |
      | 22/06/2026  | 15:00      |

    Example: OUTPUT

      | resultado               |
      | cita reprogramada       |
      | cita reprogramada       |
      | cita reprogramada       |


  Scenario Outline: Seleccionar horario no disponible

    Given que el usuario intenta reprogramar una cita
    When selecciona una fecha u hora ocupada
    Then el sistema solicita elegir otro horario

    Example: INPUT

      | fecha       | hora  |
      | 20/06/2026  | 09:00 |
      | 21/06/2026  | 11:00 |
      | 22/06/2026  | 15:00 |

    Example: OUTPUT

      | resultado                |
      | horario no disponible    |
      | horario no disponible    |
      | horario no disponible    |

Feature: US-28 - Bloqueo automático de agenda llena

  Como dueño de taller,
  Quiero que la app bloquee automáticamente horarios completos,
  Para no sobrecargar a mis mecánicos.


  Scenario Outline: Alcanzar capacidad máxima del turno

    Given que el taller tiene un límite máximo configurado
    When se confirma la última cita disponible del turno
    Then el sistema bloquea automáticamente ese horario

    Example: INPUT

      | capacidad_maxima |
      | 5                |
      | 5                |
      | 5                |

    Example: OUTPUT

      | resultado                 |
      | horario bloqueado         |
      | horario bloqueado         |
      | horario bloqueado         |


  Scenario Outline: Turno aún con disponibilidad

    Given que el taller tiene espacios libres
    When un cliente consulta horarios
    Then el sistema mantiene el horario habilitado

    Example: INPUT

      | citas_registradas |
      | 1                 |
      | 2                 |
      | 4                 |

    Example: OUTPUT

      | resultado            |
      | horario disponible   |
      | horario disponible   |
      | horario disponible   |

Feature: US-29 - Sugerencia automática de horario óptimo

  Como conductor,
  Quiero que la app me sugiera horarios convenientes para mantenimiento,
  Para reducir tiempos de espera.


  Scenario Outline: Mostrar horarios óptimos

    Given que existen datos históricos de tráfico del taller
    When el usuario abre el módulo de programación
    Then el sistema destaca los horarios recomendados

    Example: INPUT

      | taller      |
      | Taller A    |
      | Taller B    |
      | Taller C    |

    Example: OUTPUT

      | resultado                    |
      | horario recomendado          |
      | horario recomendado          |
      | horario recomendado          |


  Scenario Outline: No existen datos suficientes

    Given que el taller no tiene historial suficiente
    When el usuario abre el módulo de programación
    Then el sistema muestra horarios estándar sin sugerencias

    Example: INPUT

      | historial |
      | vacío     |
      | insuficiente |
      | mínimo    |

    Example: OUTPUT

      | resultado                |
      | sin recomendación        |
      | sin recomendación        |
      | sin recomendación        |

Feature: US-30 - Confirmación automática de cita

  Como conductor,
  Quiero recibir confirmación inmediata de una reserva,
  Para tener seguridad de que mi cita fue registrada.


  Scenario Outline: Confirmar reserva exitosamente

    Given que una cita fue reservada correctamente
    When el pago o validación es procesado
    Then el sistema envía una confirmación inmediata

    Example: INPUT

      | estado_pago |
      | aprobado    |
      | aprobado    |
      | aprobado    |

    Example: OUTPUT

      | resultado                  |
      | confirmación enviada       |
      | confirmación enviada       |
      | confirmación enviada       |


  Scenario Outline: Error durante la confirmación

    Given que una cita fue registrada
    When ocurre un error durante la validación
    Then el sistema informa que la confirmación no pudo completarse

    Example: INPUT

      | estado_pago |
      | rechazado   |
      | pendiente   |
      | error       |

    Example: OUTPUT

      | resultado                    |
      | confirmación fallida         |
      | confirmación fallida         |
      | confirmación fallida         |

Feature: US-31 - Envío de evidencia de repuestos

  Como dueño de taller,
  Quiero subir fotos de la pieza dañada y la nueva,
  Para demostrar evidencia del cambio y evitar reclamos.


  Scenario Outline: Subir evidencia fotográfica correctamente

    Given que el vehículo se encuentra en proceso de reparación
    When el mecánico carga una fotografía del repuesto reemplazado
    Then el sistema envía una notificación al cliente con la imagen adjunta

    Example: INPUT

      | tipo_foto          |
      | pieza dañada       |
      | pieza nueva        |
      | comparación final  |

    Example: OUTPUT

      | resultado                    |
      | evidencia enviada            |
      | evidencia enviada            |
      | evidencia enviada            |


  Scenario Outline: Intentar enviar evidencia sin imagen

    Given que el vehículo se encuentra en reparación
    When el mecánico intenta registrar evidencia sin adjuntar archivos
    Then el sistema solicita cargar una fotografía válida

    Example: INPUT

      | archivo |
      | vacío   |
      | vacío   |
      | vacío   |

    Example: OUTPUT

      | resultado                |
      | imagen requerida         |
      | imagen requerida         |
      | imagen requerida         |

Feature: US-32 - Autorización de trabajo extra con evidencia

  Como conductor,
  Quiero recibir una foto si el mecánico encuentra un daño adicional,
  Para autorizar el aumento del presupuesto con pruebas visuales reales.


  Scenario Outline: Autorizar reparación adicional

    Given que el mecánico detectó una avería adicional
    And adjuntó evidencia fotográfica
    When el cliente selecciona "Autorizar Adicional"
    Then el sistema agrega el costo extra y notifica al mecánico

    Example: INPUT

      | costo_adicional |
      | S/150           |
      | S/300           |
      | S/500           |

    Example: OUTPUT

      | resultado                  |
      | trabajo autorizado         |
      | trabajo autorizado         |
      | trabajo autorizado         |


  Scenario Outline: Rechazar reparación adicional

    Given que existe una solicitud de reparación adicional
    When el cliente selecciona "Rechazar"
    Then el sistema registra la negativa y notifica al taller

    Example: INPUT

      | solicitud |
      | pendiente |
      | pendiente |
      | pendiente |

    Example: OUTPUT

      | resultado                 |
      | trabajo rechazado         |
      | trabajo rechazado         |
      | trabajo rechazado         |

Feature: US-33 - Video del proceso de reparación

  Como cliente,
  Quiero visualizar clips breves de la reparación,
  Para conocer el avance real del servicio.


  Scenario Outline: Subir video de reparación

    Given que la reparación continúa en proceso
    When el mecánico carga un archivo de video
    Then el cliente recibe una notificación y puede visualizarlo

    Example: INPUT

      | archivo_video |
      | video1.mp4    |
      | video2.mp4    |
      | video3.mp4    |

    Example: OUTPUT

      | resultado              |
      | video disponible       |
      | video disponible       |
      | video disponible       |


  Scenario Outline: Archivo inválido

    Given que la reparación continúa en proceso
    When el mecánico intenta subir un archivo no compatible
    Then el sistema rechaza la carga

    Example: INPUT

      | archivo |
      | doc.pdf |
      | txt.txt |
      | xlsx    |

    Example: OUTPUT

      | resultado              |
      | formato inválido       |
      | formato inválido       |
      | formato inválido       |

Feature: US-34 - Línea de tiempo visual de reparación

  Como conductor,
  Quiero visualizar una línea de tiempo gráfica con cada etapa de reparación,
  Para conocer el progreso exacto del servicio.


  Scenario Outline: Mostrar progreso cronológico

    Given que el taller actualiza los hitos del servicio
    When el cliente abre la vista de progreso
    Then el sistema muestra las etapas completadas, actuales y pendientes

    Example: INPUT

      | etapa_actual |
      | Diagnóstico  |
      | Reparación   |
      | Pruebas      |

    Example: OUTPUT

      | resultado                  |
      | línea de tiempo visible    |
      | línea de tiempo visible    |
      | línea de tiempo visible    |


  Scenario Outline: Servicio recién registrado

    Given que el vehículo acaba de ingresar al taller
    When el cliente abre la vista de progreso
    Then el sistema muestra únicamente la etapa inicial

    Example: INPUT

      | etapa_actual |
      | Recepción    |
      | Recepción    |
      | Recepción    |

    Example: OUTPUT

      | resultado             |
      | etapa inicial visible |
      | etapa inicial visible |
      | etapa inicial visible |

Feature: US-35 - Registro fotográfico final del servicio

  Como conductor particular,
  Quiero recibir evidencia visual final del vehículo reparado,
  Para verificar que el trabajo fue completado antes de recogerlo.


  Scenario Outline: Adjuntar fotografías finales

    Given que la reparación fue marcada como completada
    When el mecánico carga las fotografías finales
    Then el sistema las adjunta al reporte final del servicio

    Example: INPUT

      | cantidad_fotos |
      | 3              |
      | 5              |
      | 8              |

    Example: OUTPUT

      | resultado                    |
      | reporte actualizado          |
      | reporte actualizado          |
      | reporte actualizado          |


  Scenario Outline: Finalizar servicio sin evidencia

    Given que la reparación fue marcada como completada
    When el mecánico intenta cerrar el servicio sin fotografías
    Then el sistema solicita adjuntar evidencia visual

    Example: INPUT

      | cantidad_fotos |
      | 0              |
      | 0              |
      | 0              |

    Example: OUTPUT

      | resultado                    |
      | evidencia requerida          |
      | evidencia requerida          |
      | evidencia requerida          |

Feature: US-36 - Creación de perfil vehicular

  Como usuario nuevo,
  Quiero registrar el modelo y año de mi auto,
  Para recibir recomendaciones de mantenimiento exactas para mi motor.

  Escenario alternativo: Guardar un vehículo nuevo con datos válidos
    Dado que el usuario está en la vista "Mi Garaje"
    Cuando ingresa la <marca> y el <anio> y presiona "Guardar"
    Entonces el sistema crea y muestra una tarjeta de perfil específica para ese vehículo

    Ejemplos: INPUT
      | marca      | anio |
      | Toyota     | 2020 |
      | Hyundai    | 2018 |

    Ejemplos: OUTPUT
      | resultado          |
      | tarjeta creada     |
      | tarjeta creada     |

  Escenario alternativo: Intentar guardar un vehículo con año inválido
    Dado que el usuario está en la vista "Mi Garaje"
    Cuando ingresa la <marca> con un <anio_invalido> fuera de rango
    Entonces el sistema bloquea el registro y muestra el <mensaje_error>

    Ejemplos: INPUT
      | marca      | anio_invalido |
      | Kia        | 1850          |
      | Nissan     | 2030          |

    Ejemplos: OUTPUT
      | mensaje_error                   |
      | "Año fuera de rango permitido"  |
      | "El año no puede ser futuro"    |

Feature: US-37 - Recordatorios legales (SOAT/Revisión)

  Como conductor de aplicativo,
  Quiero registrar la fecha de vencimiento de mi SOAT y revisión técnica en mi perfil,
  Para que la app me avise antes de que expiren y evitar multas.

  Escenario alternativo: Alerta de vencimiento de documento legal
    Dado que el usuario ha ingresado la fecha de vencimiento de su SOAT
    Cuando la fecha actual es <dias_restantes> días antes del vencimiento
    Entonces el sistema <accion_banner> un banner de advertencia en la vista "Mi Garaje"

    Ejemplos: INPUT
      | dias_restantes |
      | 7              |
      | 3              |
      | 15             |

    Ejemplos: OUTPUT
      | accion_banner       |
      | muestra banner      |
      | muestra banner      |
      | no muestra banner   |

  Escenario alternativo: Intentar guardar un documento ya vencido
    Dado que el usuario está registrando las fechas de sus documentos
    Cuando ingresa una fecha de vencimiento con <dias_vencidos> en el pasado
    Entonces el sistema guarda el registro pero activa una <alerta_inmediata>

    Ejemplos: INPUT
      | dias_vencidos |
      | -1            |
      | -10           |

    Ejemplos: OUTPUT
      | alerta_inmediata               |
      | Alerta: SOAT vencido ayer      |
      | Alerta: Requiere renovación ya |

Feature: US-38 - Registro de múltiples vehículos

  Como usuario con más de un automóvil,
  Quiero registrar varios vehículos dentro de mi cuenta,
  Para monitorear el estado de cada uno desde una sola plataforma.

  Escenario alternativo: Agregar múltiples vehículos dentro del límite
    Dado que el usuario ya tiene <vehiculos_actuales> vehículo registrado
    Cuando completa el formulario de registro de un nuevo vehículo
    Entonces el sistema añade la tarjeta mostrando un total de <total_vehiculos>

    Ejemplos: INPUT
      | vehiculos_actuales |
      | 1                  |
      | 2                  |

    Ejemplos: OUTPUT
      | total_vehiculos    |
      | 2 tarjetas         |
      | 3 tarjetas         |

  Escenario alternativo: Intentar exceder el límite máximo de vehículos
    Dado que el usuario ya tiene <vehiculos_al_limite> autos en su garaje
    Cuando intenta presionar el botón "Agregar Vehículo"
    Entonces el sistema <restriccion_UI> para evitar más registros

    Ejemplos: INPUT
      | vehiculos_al_limite |
      | 5                   |

    Ejemplos: OUTPUT
      | restriccion_UI                                   |
      | deshabilita botón y pide cuenta Premium o taller |

Feature: US-39 - Selección rápida entre vehículos

  Como usuario,
  Quiero cambiar fácilmente entre mis vehículos registrados,
  Para consultar rápidamente el estado del que necesite revisar.

  Escenario alternativo: Cambiar entre vehículos de forma fluida
    Dado que hay múltiples vehículos registrados en la cuenta
    Cuando el usuario selecciona la tarjeta del <vehiculo_seleccionado>
    Entonces el dashboard cambia y renderiza el <modelo_cargado> correspondiente

    Ejemplos: INPUT
      | vehiculo_seleccionado |
      | Toyota Yaris          |
      | Hyundai Accent        |

    Ejemplos: OUTPUT
      | modelo_cargado               |
      | Datos y telemetría de Yaris  |
      | Datos y telemetría de Accent |

  Escenario alternativo: Cambiar a un vehículo sin datos de telemetría recientes
    Dado que el usuario tiene un auto guardado que no ha sido usado con el OBD-II
    Cuando selecciona la tarjeta del <vehiculo_inactivo>
    Entonces el dashboard se actualiza mostrando un <estado_dashboard>

    Ejemplos: INPUT
      | vehiculo_inactivo |
      | Nissan Sentra 98  |

    Ejemplos: OUTPUT
      | estado_dashboard                     |
      | "Sin datos en tiempo real - Sincronice" |

Feature: US-40 - Indicador general del estado del vehículo

  Como conductor particular,
  Quiero visualizar un indicador general de salud de mi vehículo,
  Para entender rápidamente si necesita atención inmediata.

  Escenario alternativo: Mostrar el puntaje de salud por colores
    Dado que los datos de telemetría están disponibles en el sistema
    Cuando el usuario ingresa al perfil con un puntaje de <salud_porcentaje>
    Entonces el indicador visual cambia al <indicador_color> asignado

    Ejemplos: INPUT
      | salud_porcentaje |
      | 95               |
      | 65               |
      | 35               |

    Ejemplos: OUTPUT
      | indicador_color  |
      | color verde      |
      | color amarillo   |
      | color rojo       |

  Escenario alternativo: Estado de salud cuando falla la conexión con el sensor
    Dado que el vehículo no está enviando datos por problemas de red o bluetooth
    Cuando el usuario abre la pantalla de salud vehicular
    Entonces el sistema muestra un estado <indicador_alternativo>

    Ejemplos: INPUT
      | estado_conexion  |
      | Desconectado     |

    Ejemplos: OUTPUT
      | indicador_alternativo       |
      | "Puntaje Gris (Desconocido)" |

Feature: US-41 - Filtro de talleres por calificación

  Como conductor particular,
  Quiero buscar talleres filtrando por los de mayor calificación,
  Para asegurar que dejo mi auto en un lugar confiable.

  Escenario alternativo: Aplicar filtros de calificación con éxito
    Dado que el mapa de búsqueda de talleres está abierto
    Cuando el usuario presiona el chip de filtro <filtro_estrellas>
    Entonces el mapa se actualiza mostrando solo pines de talleres con <calificacion_minima>

    Ejemplos: INPUT
      | filtro_estrellas |
      | "+4 Estrellas"   |
      | "+3 Estrellas"   |

    Ejemplos: OUTPUT
      | calificacion_minima |
      | pines >= 4 estrellas |
      | pines >= 3 estrellas |

  Escenario alternativo: Aplicar filtro de alta calificación sin locales disponibles
    Dado que el usuario se encuentra en una zona con pocos talleres registrados
    Cuando selecciona el filtro "+5 Estrellas (Perfecto)"
    Entonces el mapa <resultado_vacio> y ofrece una alternativa

    Ejemplos: INPUT
      | filtro_estrellas |
      | "+5 Estrellas"   |

    Ejemplos: OUTPUT
      | resultado_vacio                                     |
      | Limpia pines y muestra "No hay talleres con 5 estrellas cerca" |

Feature: US-42 - Búsqueda por geolocalización

  Como conductor particular,
  Quiero ver en el mapa los talleres que están en un radio de 5km de mi ubicación actual,
  Para encontrar ayuda rápida si mi carro empieza a fallar en la calle.

  Escenario alternativo: Cargar talleres dentro del radio permitido
    Dado que el usuario otorgó los permisos de ubicación GPS correspondientes
    Cuando abre la pantalla de "Buscar Talleres"
    Entonces el mapa se centra en su posición y renderiza pines hasta una <distancia_maxima>

    Ejemplos: INPUT
      | distancia_maxima |
      | 5km              |

    Ejemplos: OUTPUT
      | resultado                     |
      | pines cargados dentro de 5km  |

  Escenario alternativo: Abrir el mapa con el GPS del dispositivo apagado
    Dado que el usuario desea ver talleres cerca de él
    Cuando abre el mapa pero el GPS del celular está <estado_gps>
    Entonces el sistema solicita la activación del servicio mediante un <aviso_pantalla>

    Ejemplos: INPUT
      | estado_gps |
      | Apagado    |

    Ejemplos: OUTPUT
      | aviso_pantalla                             |
      | Popup: "Activa tu GPS para ver talleres"  |

Feature: US-43 - Filtro de disponibilidad inmediata

  Como taxista con una avería en curso,
  Quiero filtrar los talleres para ver únicamente los que tienen disponibilidad para una atención inmediata,
  Para no perder tiempo yendo a locales llenos.

  Escenario alternativo: Filtrar talleres con bahías de atención libres
    Dado que el usuario activó la lista de talleres cercanos
    Cuando enciende el interruptor de "Atención Inmediata" evaluando un local con <estado_cola>
    Entonces la interfaz procesa la visibilidad resultando en <visibilidad_taller>

    Ejemplos: INPUT
      | estado_cola |
      | llena       |
      | disponible  |

    Ejemplos: OUTPUT
      | visibilidad_taller |
      | oculta taller      |
      | muestra taller     |

  Escenario alternativo: Activar filtro de emergencia en hora pico sin talleres libres
    Dado que todos los talleres de la zona están atendiendo a máxima capacidad
    Cuando el usuario activa el interruptor de "Atención Inmediata"
    Entonces la lista se vacía y muestra el <mensaje_asistencia>

    Ejemplos: INPUT
      | talleres_disponibles |
      | 0                    |

    Ejemplos: OUTPUT
      | mensaje_asistencia                            |
      | "Todos los talleres están llenos. ¿Deseas grúa?"|

Feature: US-44 - Filtro por especialidad mecánica

  Como conductor particular,
  Quiero filtrar talleres según especialidad mecánica,
  Para encontrar atención adecuada al tipo de falla detectada.

  Escenario alternativo: Aplicar filtro por tipo de falla técnica
    Dado que la interfaz de búsqueda está activa
    Cuando el usuario elige la categoría de <especialidad> en la barra superior
    Entonces el sistema solo muestra los talleres que ofrecen <servicio_coincidente>

    Ejemplos: INPUT
      | especialidad |
      | Frenos       |
      | Eléctrico    |

    Ejemplos: OUTPUT
      | servicio_coincidente |
      | talleres de frenos   |
      | talleres eléctricos  |

  Escenario alternativo: Combinar filtros de especialidad sin coincidencias
    Dado que el usuario tiene seleccionado el filtro de "Planchado y Pintura"
    Cuando añade de manera simultánea el filtro de <segunda_especialidad> incompatible en talleres chicos
    Entonces el sistema arroja <resultado_busqueda>

    Ejemplos: INPUT
      | segunda_especialidad |
      | "Electrónica Avanzada"|

    Ejemplos: OUTPUT
      | resultado_busqueda                        |
      | "No se encontraron talleres con ambas especialidades" |

Feature: US-45 - Visualización de tiempo estimado de atención

  Como taxista,
  Quiero conocer el tiempo estimado de espera en cada taller,
  Para elegir la opción que afecte menos mi jornada laboral.

  Escenario alternativo: Calcular tiempo estimado según fila de vehículos
    Dado que los talleres actualizan sus operaciones en la plataforma
    Cuando el usuario navega por las opciones viendo un taller con <autos_en_espera>
    Entonces la UI calcula y coloca la etiqueta de <tiempo_estimado>

    Ejemplos: INPUT
      | autos_en_espera |
      | 0               |
      | 2               |
      | 4               |

    Ejemplos: OUTPUT
      | tiempo_estimado |
      | "0 min de espera"|
      | "30 min de espera"|
      | "60 min de espera"|

  Escenario alternativo: Taller con cola congelada o fuera de horario
    Dado que el taller ha cerrado sus puertas o pausado recepciones
    Cuando el usuario entra a revisar su tarjeta informativa
    Entonces el tiempo estimado cambia por un <estado_taller>

    Ejemplos: INPUT
      | situacion_taller |
      | Cerrado          |

    Ejemplos: OUTPUT
      | estado_taller                      |
      | "No disponible - Fuera de horario" |

Feature: US-46 - Pago integrado de servicios

  Como conductor,
  Quiero pagar la reparación directamente desde la app,
  Para agilizar el recojo de mi vehículo en el taller sin hacer colas.

  Escenario alternativo: Procesar pasarela de pago exitosa
    Dado que la reparación terminó y la orden de cobro está lista
    Cuando el usuario pulsa "Pagar" usando una <tarjeta_valida>
    Entonces el sistema <resultado_pago> y desbloquea el código de retiro

    Ejemplos: INPUT
      | tarjeta_valida |
      | Visa_Debito    |
      | Master_Credit  |

    Ejemplos: OUTPUT
      | resultado_pago       |
      | Transacción exitosa   |
      | Transacción exitosa   |

  Escenario alternativo: Intento de pago con fondos insuficientes u otra falla bancaria
    Dado que el monto del servicio está reflejado en pantalla
    Cuando procesa la transacción mediante una <tarjeta_con_error>
    Entonces la app detiene el flujo operativo y despliega un <motivo_rechazo>

    Ejemplos: INPUT
      | tarjeta_con_error |
      | Tarjeta_Expirada  |
      | Saldo_Insuficiente|

    Ejemplos: OUTPUT
      | motivo_rechazo                    |
      | Error: "Tarjeta vencida"          |
      | Error: "Fondos insuficientes"     |

Feature: US-47 - Descarga de comprobante digital

  Como conductor particular,
  Quiero descargar mi boleta o factura digital desde la app tras realizar el pago,
  Para tener un sustento tributario y evitar guardar papeles que se pierden.

  Escenario alternativo: Descarga de archivo tributario correcto
    Dado que se confirmó el pago en la base de datos de FastEngine
    Cuando el usuario marca la opción de <tipo_comprobante> y le da a "Descargar"
    Entonces se compila y almacena localmente el archivo <nombre_archivo>

    Ejemplos: INPUT
      | tipo_comprobante |
      | Boleta           |
      | Factura          |

    Ejemplos: OUTPUT
      | nombre_archivo      |
      | boleta_servicio.pdf |
      | factura_servicio.pdf|

  Escenario alternativo: Intentar descargar comprobante sin permisos de almacenamiento
    Dado que el flujo de pago concluyó con éxito
    Cuando el usuario intenta bajar el archivo pero la app tiene los <permisos_dispositivo> denegados
    Entonces el sistema muestra un popup solicitando habilitar el acceso a carpetas

    Ejemplos: INPUT
      | permisos_dispositivo |
      | Denegados            |

    Ejemplos: OUTPUT
      | resultado_sistema                                     |
      | Popup: "Se requieren permisos para guardar el archivo"|

Feature: US-48 - Panel de ingresos mensuales

  Como dueño de taller,
  Quiero visualizar un gráfico con la suma de los servicios cobrados en el mes,
  Para llevar un mejor control financiero de mi negocio sin usar cuadernos.

  Escenario alternativo: Renderizar gráfico con transacciones reales
    Dado que el dueño ingresó al módulo "Finanzas" de su cuenta corporativa
    Cuando carga el reporte visual del <mes_analizado>
    Entonces la barra estadística refleja exactamente el <monto_acumulado>

    Ejemplos: INPUT
      | mes_analizado |
      | Mayo          |
      | Junio         |

    Ejemplos: OUTPUT
      | monto_acumulado |
      | S/. 4500.00     |
      | S/. 6200.00     |

  Escenario alternativo: Visualizar mes nuevo sin transacciones registradas
    Dado que el dueño abre las métricas al inicio de un nuevo periodo contable
    Cuando el sistema consulta las transacciones del <mes_vacio>
    Entonces el gráfico se muestra en cero de forma limpia sin romperse la UI

    Ejemplos: INPUT
      | mes_vacio |
      | Julio     |

    Ejemplos: OUTPUT
      | resultado_interfaz               |
      | Gráfico en 0 y texto "Sin ingresos"|

Feature: US-49 - Pago fraccionado de reparaciones

  Como conductor particular,
  Quiero dividir el pago de reparaciones costosas en cuotas digitales,
  Para poder asumir gastos imprevistos sin afectar drásticamente mi economía mensual.

  Escenario alternativo: Seleccionar plan de cuotas aprobado
    Dado que la cotización final supera la barrera de financiamiento mínima
    Cuando el cliente selecciona dividir el saldo en <cantidad_cuotas>
    Entonces la app calcula las mensualidades y procesa la firma digital del acuerdo

    Ejemplos: INPUT
      | cantidad_cuotas |
      | 3 cuotas        |
      | 6 cuotas        |

    Ejemplos: OUTPUT
      | resultado                       |
      | Plan de 3 meses configurado ok  |
      | Plan de 6 meses configurado ok  |

  Escenario alternativo: Intentar fraccionar un monto menor al permitido
    Dado que la factura del taller es por un monto bajo
    Cuando el cliente intenta activar la opción "Pagar en Cuotas" con un <monto_factura>
    Entonces el sistema deniega el fraccionamiento indicando la <razon_bloqueo>

    Ejemplos: INPUT
      | monto_factura |
      | S/. 50.00     |

    Ejemplos: OUTPUT
      | razon_bloqueo                                       |
      | "Monto mínimo para financiamiento es de S/. 300.00" |

Feature: US-50 - Historial financiero del taller

  Como dueño de taller,
  Quiero consultar un historial financiero detallado de todos los pagos procesados,
  Para controlar ingresos, detectar tendencias y planificar mejor mi negocio.

  Escenario alternativo: Filtrar y ordenar la lista histórica de ingresos
    Dado que el historial cuenta con transacciones previas almacenadas
    Cuando el mecánico jefe aplica el <criterio_filtro> sobre el buscador
    Entonces las filas de información se reordenan según la <organizacion_datos>

    Ejemplos: INPUT
      | criterio_filtro |
      | "Fecha"         |
      | "Cliente"       |

    Ejemplos: OUTPUT
      | organizacion_datos         |
      | Orden cronológico descendente |
      | Lista agrupada alfabéticamente|

  Escenario alternativo: Buscar un cliente inexistente en los registros financieros
    Dado que el módulo de registros contables está desplegado en pantalla
    Cuando escribe un <nombre_buscado> que no registra pagos en la app
    Entonces la tabla oculta las filas y renderiza una advertencia de vacío

    Ejemplos: INPUT
      | nombre_buscado     |
      | "Juan Perez Falso" |

    Ejemplos: OUTPUT
      | resultado_tabla                             |
      | "No se encontraron transacciones asociadas"|