view: transaction_new {
  derived_table: {
    sql: select ABC_Indicator,
      Commodity_cd,
      lead_time_days Lead_Time_Variance,
      #Mat_Product_Num,
      Movement_Type,
      #OTIF,
      PPS,
      Plant_Cd,
      Plant_City_Name,
      Plant_Country_Cd,
      Plant_Region_Cd,
      Product_num,
      Vendor_City,
      Vendor_Country_Cd,
      #delivdt_variance,
      explanation.attributions[offset(0)].featureAttributions.purch_doc_item_num ex_purch_doc_item_num,
      explanation.attributions[offset(0)].featureAttributions.purch_doc_num ex_purch_doc_num,
      explanation.attributions[offset(0)].featureAttributions.purch_doc_dt ex_purch_doc_dt,
      explanation.attributions[offset(0)].featureAttributions.purch_order_quan ex_purch_order_quan,
      explanation.attributions[offset(0)].featureAttributions.product_base_uom_meas ex_product_base_uom_meas,
      explanation.attributions[offset(0)].featureAttributions.product_type_cd ex_product_type_cd,
      explanation.attributions[offset(0)].featureAttributions.product_grp_cd ex_product_grp_cd,
      explanation.attributions[offset(0)].featureAttributions.vendor_num ex_vendor_num,
      explanation.attributions[offset(0)].featureAttributions.Vendor_City ex_Vendor_City,
      explanation.attributions[offset(0)].featureAttributions.Vendor_Country_Cd ex_Vendor_Country_Cd,
      explanation.attributions[offset(0)].featureAttributions.Product_num ex_Product_num,
      explanation.attributions[offset(0)].featureAttributions.incoterms_part1 ex_incoterms_part1,
      explanation.attributions[offset(0)].featureAttributions.ABC_Indicator ex_ABC_Indicator,
      explanation.attributions[offset(0)].featureAttributions.Commodity_cd ex_Commodity_cd,
      explanation.attributions[offset(0)].featureAttributions.Plant_Cd ex_Plant_Cd,
      explanation.attributions[offset(0)].featureAttributions.Plant_City_Name ex_Plant_City_Name,
      explanation.attributions[offset(0)].featureAttributions.Plant_Region_Cd ex_Plant_Region_Cd,
      explanation.attributions[offset(0)].featureAttributions.Plant_Country_Cd ex_Plant_Country_Cd,
      explanation.attributions[offset(0)].featureAttributions.net_price_curr ex_net_price_curr,
      #explanation.attributions[offset(0)].featureAttributions.goods_receipt_process_time_days ex_goods_receipt_process_time_days,
      #explanation.attributions[offset(0)].featureAttributions.pdsll_item_delivery_dt ex_pdsll_item_delivery_dt,
      explanation.attributions[offset(0)].featureAttributions.PPS ex_PPS,
      explanation.attributions[offset(0)].outputDisplayName ex_outputDisplayName,
      #goods_receipt_process_time_days,
      incoterms_part1,
      net_price_curr,
      #pdsll_item_delivery_dt,
      item_delivery_dt pdsll_item_delivery_dt,
      #pdsll_mat_grp_cd,
      predicted_OTIF.scores[offset(0)] o_scores,
      predicted_OTIF.scores[offset(1)] l_scores,
      product_base_uom_meas,
      product_grp_cd,
      product_type_cd,
      purch_doc_dt,
      purch_doc_item_num,
      purch_doc_num,
      purch_order_quan,
      vendor_num,
      row_number() OVER(ORDER BY purch_doc_dt) AS prim_key
      from `mi-4-305707.cswg_cust_reliability.predictions_2022_10_09T05_30_48_018Z_351`
       ;;
  }

  dimension: prim_key {
    type: number
    primary_key: yes
    sql: ${TABLE}.prim_key ;;
  }

  dimension: abc_indicator {
    type: string
    sql: ${TABLE}.ABC_Indicator ;;
  }



  dimension: commodity_cd {
    type: string
    sql: ${TABLE}.Commodity_cd ;;
  }

  dimension: lead_time_variance {
    type: string
    label: "Lead Time"
    sql: ${TABLE}.Lead_Time_Variance ;;
  }

  #dimension: mat_product_num {
  #  type: string
  #  sql: ${TABLE}.Mat_Product_Num ;;
  #}

  dimension: movement_type {
    type: string
    sql: ${TABLE}.Movement_Type ;;
  }

  #dimension: otif {
  #  type: string
  #  sql: ${TABLE}.OTIF ;;
  #}

  dimension: pps {
    type: string
    primary_key: yes
    sql: ${TABLE}.PPS ;;
  }

  dimension: plant_cd {
    type: string
    sql: ${TABLE}.Plant_Cd ;;
  }

  dimension: plant_city_name {
    type: string
    sql: ${TABLE}.Plant_City_Name ;;
  }

  dimension: plant_country_cd {
    type: string
    sql: ${TABLE}.Plant_Country_Cd ;;
  }

  dimension: plant_region_cd {
    type: string
    sql: ${TABLE}.Plant_Region_Cd ;;
  }

  dimension: product_num {
    type: string
    label: "Product"
    sql: ${TABLE}.Product_num ;;
    value_format_name: id
  }

  dimension: vendor_city {
    type: string
    sql: ${TABLE}.Vendor_City ;;
  }

  dimension: vendor_country_cd {
    type: string
    sql: ${TABLE}.Vendor_Country_Cd ;;
  }

  #dimension: delivdt_variance {
  #  type: string
  #  sql: ${TABLE}.delivdt_variance ;;
  #}

  measure: ex_purch_doc_item_num {
    type: number
    label: "Purch Doc Item Num"
    sql: case when ${TABLE}.ex_purch_doc_item_num >=${popup_donut} then ${TABLE}.ex_purch_doc_item_num end ;;
  }

  measure: ex_purch_doc_num {
    type: number
    label: "Purch Doc Num"
    sql: case when ${TABLE}.ex_purch_doc_num >=${popup_donut} then ${TABLE}.ex_purch_doc_num end ;;
  }

  measure: ex_purch_doc_dt {
    type: number
    label: "Purch Doc Dt"
    sql: case when ${TABLE}.ex_purch_doc_dt >=${popup_donut} then ${TABLE}.ex_purch_doc_dt end ;;
  }

  measure: ex_purch_order_quan {
    type: number
    label: "Purch Order Quantity"
    sql: case when ${TABLE}.ex_purch_order_quan >=${popup_donut} then ${TABLE}.ex_purch_order_quan end ;;
  }

  measure: ex_product_base_uom_meas {
    type: number
    label: "Product Base Uom Meas"
    sql: case when ${TABLE}.ex_product_base_uom_meas >=${popup_donut} then ${TABLE}.ex_product_base_uom_meas end ;;
  }

  measure: ex_product_type_cd {
    type: number
    label: "Product Type Cd"
    sql: case when ${TABLE}.ex_product_type_cd >=${popup_donut} then ${TABLE}.ex_product_type_cd end ;;
  }

  measure: ex_product_grp_cd {
    type: number
    label: "Product Group Cd"
    sql: case when ${TABLE}.ex_product_grp_cd >=${popup_donut} then ${TABLE}.ex_product_grp_cd end ;;
  }

  measure: ex_vendor_num {
    type: number
    label: "Vendor Number"
    sql: case when ${TABLE}.ex_vendor_num >=${popup_donut} then ${TABLE}.ex_vendor_num end ;;
  }

  measure: ex_vendor_city {
    type: number
    label: "Vendor City"
    sql: case when ${TABLE}.ex_vendor_city >=${popup_donut} then ${TABLE}.ex_vendor_city end ;;
  }

  measure: ex_vendor_country_cd {
    type: number
    label: " Vendor Country Code"
    sql: case when ${TABLE}.ex_vendor_country_cd >=${popup_donut} then ${TABLE}.ex_vendor_country_cd end ;;
  }

  measure: ex_product_num {
    type: number
    label: "Product number"
    sql: case when ${TABLE}.ex_product_num >=${popup_donut} then ${TABLE}.ex_product_num end ;;
  }

  measure: ex_incoterms_part1 {
    type: number
    label: "Incoterms Part1"
    sql: case when ${TABLE}.ex_incoterms_part1 >=${popup_donut} then ${TABLE}.ex_incoterms_part1 end ;;
  }

  measure: ex_abc_indicator {
    type: number
    label: "ABC Indicator"
    sql: case when ${TABLE}.ex_abc_indicator >=${popup_donut} then ${TABLE}.ex_abc_indicator end ;;
  }

  measure: ex_commodity_cd {
    type: number
    label: "Commodity Cd"
    sql: case when ${TABLE}.ex_commodity_cd >=${popup_donut} then ${TABLE}.ex_commodity_cd end ;;
  }

  measure: ex_plant_cd {
    type: number
    label: "Plant Cd"
    sql: case when ${TABLE}.ex_plant_cd >=${popup_donut} then ${TABLE}.ex_plant_cd end ;;
  }

  measure: ex_plant_city_name {
    type: number
    label: "Plant City Name"
    sql: case when ${TABLE}.ex_plant_city_name >=${popup_donut} then ${TABLE}.ex_plant_city_name end ;;
  }

  measure: ex_plant_region_cd {
    type: number
    label: "Plant Region Code"
    sql: case when ${TABLE}.ex_plant_region_cd >=${popup_donut} then ${TABLE}.ex_plant_region_cd end ;;
  }

  measure: ex_plant_country_cd {
    type: number
    label: "Plant Country Code"
    sql: case when ${TABLE}.ex_plant_country_cd >=${popup_donut} then ${TABLE}.ex_plant_country_cd end ;;
  }

  measure: ex_net_price_curr {
    type: number
    label: "Net Price Curr"
    sql: case when ${TABLE}.ex_net_price_curr >=${popup_donut} then ${TABLE}.ex_net_price_curr end ;;
  }

  #measure: ex_goods_receipt_process_time_days {
  #  type: number
  #  sql: case when ${TABLE}.ex_goods_receipt_process_time_days >=${popup_donut} then ${TABLE}.ex_goods_receipt_process_time_days end ;;
  #}

  #measure: ex_pdsll_item_delivery_dt {
  #  type: number
  #  sql: case when ${TABLE}.ex_pdsll_item_delivery_dt >=${popup_donut} then ${TABLE}.ex_pdsll_item_delivery_dt end ;;
  #}

  measure: ex_pps {
    type: number
    label: "PPS"
    sql: case when ${TABLE}.ex_pps >=${popup_donut} then ${TABLE}.ex_pps end ;;
  }

  dimension: ex_output_display_name {
    type: string
    label: "Output Display Name"
    sql: ${TABLE}.ex_outputDisplayName ;;
  }

  dimension: goods_receipt_process_time_days {
    type: string
    sql: ${TABLE}.goods_receipt_process_time_days ;;
  }

  dimension: incoterms_part1 {
    type: string
    sql: ${TABLE}.incoterms_part1 ;;
  }

  dimension: net_price_curr {
    type: number
    sql: cast(${TABLE}.net_price_curr as FLOAT64) ;;
  }


  dimension: pdsll_item_delivery_dt {
    type: string
    sql: case when length(${TABLE}.pdsll_item_delivery_dt) =10 then concat(SUBSTR(${TABLE}.pdsll_item_delivery_dt,7,4),'-',SUBSTR(${TABLE}.pdsll_item_delivery_dt,4,2),'-',SUBSTR(${TABLE}.pdsll_item_delivery_dt,0,2)) end;;
  }

  dimension: pdsll_item_delivery_month_format {
    type: string
    label: "Expected Delivery Date"
    sql: format_date('%d-%b-%y',${pdsll_item_delivery_date});;
  }

  dimension_group: pdsll_item_delivery {
    label: "Expected Delivery Date"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql:  safe.PARSE_DATE('%Y-%m-%d',  ${TABLE}.pdsll_item_delivery_dt);;
  }

  #dimension: pdsll_mat_grp_cd {
  #  type: string
  #  sql: ${TABLE}.pdsll_mat_grp_cd ;;
  #}

  dimension: o_scores {
    type: number
    sql: ${TABLE}.o_scores ;;
  }

  dimension: l_scores {
    type: number
    sql: cast(${TABLE}.l_scores as FLOAT64);;
  }

  dimension: delay_probability {
    type: number
    sql: cast(@{delay_probability_value} as FLOAT64);;
  }

  dimension: popup_donut {
    type: number
    sql: cast(@{popup_donut_value} as FLOAT64);;
  }

  measure: l_scores_2 {
    type: number
    label: "Delay Probability"
    sql: cast(${TABLE}.l_scores as FLOAT64);;
    value_format_name: percent_0
    html: {% if l_scores._value >= delay_probability._value  %}
          <p style="background-color:#CD5C5C;text-align:right;padding-right:5px;" >{{rendered_value}}</p>
          {% else %}
          <p style="background-color:green;text-align:right;padding-right:5px;" >{{rendered_value}}</p>
          {% endif %}
          ;;

    drill_fields: [ex_purch_doc_item_num, ex_purch_doc_num, ex_purch_doc_dt, ex_purch_order_quan, ex_product_base_uom_meas, ex_product_type_cd, ex_product_grp_cd, ex_vendor_num, ex_vendor_city, ex_vendor_country_cd, ex_product_num, ex_incoterms_part1, ex_abc_indicator, ex_commodity_cd, ex_plant_cd, ex_plant_city_name, ex_plant_region_cd, ex_plant_country_cd, ex_net_price_curr,  ex_pps]
    link: {
      label: "Drill for Detailed Analysis"
      url: "
      {% assign vis_config = '{\"type\":\"looker_donut_multiples\"}' %}
      {{link}}&vis_config={{ vis_config | encode_uri}}&toggle=dat,pik,vis&limit=1"
    }
  }

  dimension: product_base_uom_meas {
    type: string
    label: "Ordering Unit"
    sql: ${TABLE}.product_base_uom_meas ;;
  }

  dimension: product_grp_cd {
    type: string
    sql: ${TABLE}.product_grp_cd ;;
  }

  dimension: product_type_cd {
    type: string
    sql: ${TABLE}.product_type_cd ;;
  }

  dimension: purch_doc_dt {
    type: string
    sql: ${TABLE}.purch_doc_dt ;;
  }

  dimension: purch_doc_item_num {
    type: string
    label: "PO Line Item"
    sql: ${TABLE}.purch_doc_item_num ;;
  }

  dimension: purch_doc_num {
    type: string
    label: "PO Number"
    sql: ${TABLE}.purch_doc_num ;;
  }

  dimension: purch_order_quan {
    type: number
    label: "PO Quantity"
    sql: cast(${TABLE}.purch_order_quan as FLOAT64) ;;
  }

  dimension: vendor_num {
    type: string
    sql: ${TABLE}.vendor_num ;;
  }

  dimension: delay_vendor_num {
    type: string
    sql: case when ${l_scores}>=@{delay_probability_value} then ${TABLE}.vendor_num end ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: delay_amount {
    type: sum
    label: "Transaction Amount"
    sql:case when ${l_scores} >= @{delay_probability_value} then ${purch_order_quan}*${net_price_curr} end ;;
    html: @{big_money_format} ;;
    drill_fields: [supplier_new.supplier_name,supplier_new.supplier_city,supplier_new.supplier_region_cd,store.store_name,store.store_country_cd,product_num,sum_po_lines_delay_risk]
  }

  measure: amount {
    type: sum
    sql:cast( ${purch_order_quan} as int)*cast(${net_price_curr} as int)  ;;
    #sql: ${purch_order_quan} *${net_price_curr};;
    html: @{big_money_format} ;;
  }

  measure: delay_count {
    type: count_distinct
    label: "Count"
    sql:case when ${l_scores} >= @{delay_probability_value} then concat(${purch_doc_num},'_',${purch_doc_item_num}) end ;;
    drill_fields: [supplier_new.supplier_name,supplier_new.supplier_city,supplier_new.supplier_region_cd,store.store_name,store.store_country_cd,product_num,delay_count]
  }

  measure: part_delay_risk {
    type: count_distinct
    label: "# of Parts at Delay Risk"
    sql:case when ${l_scores} >= @{delay_probability_value} then concat(${purch_doc_num},'_',${purch_doc_item_num}) end ;;
    html: @{big_number_format} ;;
    drill_fields: [supplier_new.supplier_name,supplier_new.supplier_city,supplier_new.supplier_region_cd,store.store_name,store.store_country_cd,product_num,sum_po_lines_delay_risk]
  }

  measure: part_delay_risk_map {
    type: count_distinct
    label: "# of Parts at Delay Risk"
    sql:case when ${l_scores} >= @{delay_probability_value} then concat(${purch_doc_num},'_',${purch_doc_item_num}) end ;;
    html: @{big_number_format} ;;
  }

  measure: po_lines_at_delay_risk {
    type: number
    label: "# of PO Lines at Delay Risk"
    #sql: count(case when ${l_scores}>=@{delay_probability_value} then concat(${purch_doc_num},${purch_doc_item_num}) end)  ;;
    sql: count(case when ${l_scores}>=@{delay_probability_value} then concat(${purch_doc_num},${purch_doc_item_num}) end)  ;;
    html: @{big_number_format} ;;
    drill_fields: [supplier_new.supplier_name,supplier_new.supplier_city,supplier_new.supplier_region_cd,store.store_name,store.store_country_cd,product_num,sum_po_lines_delay_risk]
  }
  measure: po_lines_at_delay_risk_percentage {
    type: number
    label: "# of PO Lines at Delay Risk %"
    #sql: count(case when ${l_scores}>=@{delay_probability_value} then concat(${purch_doc_num},${purch_doc_item_num}) end)  ;;
    sql: ${po_lines_at_delay_risk}/${count};;
    value_format_name: percent_0
  }

  measure: sum_po_lines_delay_risk {
    type: sum
    label: "PO Lines Value at Delay Risk"
    #sql: count(case when ${l_scores}>=@{delay_probability_value} then ${purch_doc_item_num} end) ;;
    sql: case when ${l_scores}>=@{delay_probability_value} then ${purch_order_quan}*${net_price_curr} end ;;
    html: @{big_money_format} ;;
    drill_fields: [supplier_new.supplier_name,supplier_new.supplier_city,supplier_new.supplier_region_cd,store.store_name,store.store_country_cd,product_num,sum_po_lines_delay_risk]
  }

  measure: sum_po_lines_delay_risk_supplier {
    type: sum
    sql: case when ${l_scores}>=@{delay_probability_value} then ${purch_order_quan}*${net_price_curr} end ;;
    html: @{big_money_format} ;;
    drill_fields: [supplier_new.supplier_name,supplier_new.supplier_city,supplier_new.supplier_region_cd,store.store_name,store.store_country_cd,sum_po_lines_delay_risk]
  }

  measure: sum_po_lines_delay_risk_plant {
    type: sum
    sql: case when ${l_scores}>=@{delay_probability_value} then ${purch_order_quan}*${net_price_curr} end ;;
    html: @{big_money_format} ;;
    drill_fields: [store.store_name,store.store_country_cd,supplier_new.supplier_name,supplier_new.supplier_city,sum_po_lines_delay_risk]
  }
  measure: sum_po_lines_delay_risk_map {
    type: sum
    label: "PO Lines Value at Delay Risk"
    sql: case when ${l_scores}>=@{delay_probability_value} then ${purch_order_quan}*${net_price_curr} end ;;
    html: @{big_money_format} ;;
  }


  set: detail {
    fields: [
      abc_indicator,
      commodity_cd,
      lead_time_variance,
      #mat_product_num,
      movement_type,
      #otif,
      pps,
      plant_cd,
      plant_city_name,
      plant_country_cd,
      plant_region_cd,
      product_num,
      vendor_city,
      vendor_country_cd,
      #delivdt_variance,
      ex_purch_doc_item_num,
      ex_purch_doc_num,
      ex_purch_doc_dt,
      ex_purch_order_quan,
      ex_product_base_uom_meas,
      ex_product_type_cd,
      ex_product_grp_cd,
      ex_vendor_num,
      ex_vendor_city,
      ex_vendor_country_cd,
      ex_product_num,
      ex_incoterms_part1,
      ex_abc_indicator,
      ex_commodity_cd,
      ex_plant_cd,
      ex_plant_city_name,
      ex_plant_region_cd,
      ex_plant_country_cd,
      ex_net_price_curr,
      #ex_goods_receipt_process_time_days,
      #ex_pdsll_item_delivery_dt,
      ex_pps,
      ex_output_display_name,
      goods_receipt_process_time_days,
      incoterms_part1,
      net_price_curr,
      pdsll_item_delivery_dt,
      #pdsll_mat_grp_cd,
      o_scores,
      l_scores,
      product_base_uom_meas,
      product_grp_cd,
      product_type_cd,
      purch_doc_dt,
      purch_doc_item_num,
      purch_doc_num,
      purch_order_quan,
      vendor_num
    ]
  }
}
