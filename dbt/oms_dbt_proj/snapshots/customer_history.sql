{% snapshot customer_history %}
{{ config(
    target_schema='SNAPSHOTS',
    unique_key='CUSTOMERID',
    strategy='check',
    check_cols=['phone']
    
    ) 
}}
SELECT * FROM {{ source('landing', 'cust') }}

{% endsnapshot %}