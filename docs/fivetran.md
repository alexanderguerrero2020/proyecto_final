{% docs fivetran %}

One of the following values:

| column_name        | descriptiom                                                            |
| ------------------ | ---------------------------------------------------------------------- |
| utc_date_load      | Fecha y hora en que se cargaron los datos.                             |
| \_fivetran_sync    | Fecha y hora en que se cargaron los datos.                             |
| utc_dbt_valid_from | Ordena las diferentes versiones de un registro.                        |
| utc_dbt_valid_to   | La fila más reciente de un snapshot ha de tener este parámetro a null. |

{% enddocs %}
