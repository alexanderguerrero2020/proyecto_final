{% snapshot staff_salary_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='staff_id',
      strategy='timestamp',
      updated_at='_fivetran_synced',
      invalidate_hard_deletes=True,
    )
}}

select * from {{ source('google_drive', 'staff_salary') }}

{% endsnapshot %}