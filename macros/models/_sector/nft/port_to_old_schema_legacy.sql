{% macro port_to_old_schema_legacy(model) %}

SELECT
    blockchain,
    project,
    project_version as version,
    block_date,
    block_time,
    nft_token_id as token_id,
    nft_collection as collection,
    price_usd as amount_usd,
    nft_standard as token_standard,
    trade_type,
    CAST(nft_amount as decimal(38)) as number_of_items,
    trade_category,
    'Trade' as evt_type,
    seller,
    buyer,
    CAST(price as double) as amount_original,
    CAST(price_raw as decimal(38)) as amount_raw,
    currency_symbol,
    currency_contract,
    nft_contract_address,
    project_contract_address,
    aggregator_name,
    aggregator_address,
    tx_hash,
    block_number,
    tx_from,
    tx_to,
    CAST(platform_fee_amount_raw as decimal(38)) as platform_fee_amount_raw,
    CAST(platform_fee_amount as double) as platform_fee_amount,
    platform_fee_amount_usd,
    platform_fee_percentage,
    royalty_fee_address as royalty_fee_receive_address,
    currency_symbol as royalty_fee_currency_symbol,
    CAST(royalty_fee_amount_raw as decimal(38)) as royalty_fee_amount_raw,
    CAST(royalty_fee_amount as double) as royalty_fee_amount,
    royalty_fee_amount_usd,
    royalty_fee_percentage,
    concat(project,'-',cast(block_number as varchar(20)),'-',cast(tx_hash as varchar(66)),'-',cast(sub_tx_trade_id as varchar(20))) as unique_trade_id
FROM {{ model }}

{% endmacro %}