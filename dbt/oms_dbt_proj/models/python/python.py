def model(dbt, session):
    """
    dbt Python model template
    """
    # Configure the model
    dbt.config(
        materialized="table",
        packages=["pandas"]
    )

    # Reference an existing model
    df = dbt.ref("customers_stg")

    # Load data from a source
    # df = dbt.source('my_source', 'my_table')

    # Example transformations
    # df = df.filter(df['column'] > 0)
    # df = df.withColumn('new_column', df['old_column'] * 2)

    return df