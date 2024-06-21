{% snapshot snapshot_company %}

{{
    config(
      target_schema='snapshots',
      unique_key='id',
      strategy='timestamp',
      updated_at='_fivetran_synced',
      invalidate_hard_deletes=True,
    )
}}

select * from {{ source('google_drive', 'company') }}

{% endsnapshot %}