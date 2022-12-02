connection: "thelook_ecommerce_looker-mi4"

# include all the views
include: "/views/**/*.view"

datagroup: railway_supplier_reliability_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: railway_supplier_reliability_default_datagroup

explore: railway_regions {}

explore: supplier_new {}

explore: transaction_new {
  join: supplier_new {
    view_label: "Supplier New"
    type: left_outer
    sql_on: cast( ${transaction_new.vendor_num} as int)=${supplier_new.supplier_num}  ;;
    relationship: one_to_many
  }
  join: railway_regions {
    view_label: "Railway Regions"
    type: left_outer
    sql_on: ${transaction_new.plant_cd}=${railway_regions.store_cd}  ;;
    relationship: one_to_many
  }

}
