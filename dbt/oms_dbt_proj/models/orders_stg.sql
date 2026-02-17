{{ config( materialized = 'incremental', unique_key = 'ORDERID') }}
SELECT ORDERID,
       ORDERDATE,
       CUSTOMERID,
       EMPLOYEEID,
       STOREID,
       STATUS AS STATUSCD,
       CASE WHEN STATUS = '01' THEN 'In Progress'
            WHEN STATUS = '02' THEN 'Completed'
            WHEN STATUS = '03' THEN 'Cancelled'
            ELSE 'Unknown' END AS STATUSDESC,
       updated_at
 FROM {{ source('landing', 'ordr') }}
 {% if is_incremental() %}
      WHERE updated_at > (SELECT COALESCE(MAX(updated_at), '1900-01-01') FROM {{ this }})
 {% endif %}