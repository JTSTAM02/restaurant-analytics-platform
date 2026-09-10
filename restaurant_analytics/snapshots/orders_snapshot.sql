{% snapshot orders_snapshot %}

{{
   config(
       target_schema='snapshots',
       unique_key='order_id',
       strategy='timestamp',
       updated_at='order_updated_at'
   )
}}

SELECT *
FROM {{ ref('stg_food_orders') }}

{% endsnapshot %}
