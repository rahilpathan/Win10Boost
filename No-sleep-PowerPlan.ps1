$ac_value='-SETACVALUEINDEX'
$dc_value='-SETDCVALUEINDEX'

$plan_default_high_performance='8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c'
$plan_micros_pos='81ecfc20-7806-42a4-a472-11edbdc37e96'

powercfg -SETACTIVE $plan_default_high_performance
powercfg -DELETE $plan_micros_pos > $null
powercfg -DUPLICATESCHEME $plan_default_high_performance $plan_micros_pos > $null
powercfg -CHANGENAME $plan_micros_pos 'Boost W10' 'A copy of the high performance profile that does not sleep, hibernate or turn off peripherals'
powercfg -SETACTIVE $plan_micros_pos

$subgroup_hdd='0012ee47-9041-4b5d-9b77-535fba8b1442'

    $setting_turn_off_hdd_after='6738e2c4-e8a5-4a42-b16a-e040e769756e'

    iex ('powercfg ' + $ac_value + ' ' + $plan_micros_pos + ' ' + $subgroup_hdd + ' ' + $setting_turn_off_hdd_after + ' 0')
    iex ('powercfg ' + $dc_value + ' ' + $plan_micros_pos + ' ' + $subgroup_hdd + ' ' + $setting_turn_off_hdd_after + ' 0')

$subgroup_sleep='238c9fa8-0aad-41ed-83f4-97be242c8f20'

    $setting_sleep_after='29f6c1db-86da-48c5-9fdb-f2b67b1f44da'

    iex ('powercfg ' + $ac_value + ' ' + $plan_micros_pos + ' ' + $subgroup_sleep + ' ' + $setting_sleep_after + ' 0')
    iex ('powercfg ' + $dc_value + ' ' + $plan_micros_pos + ' ' + $subgroup_sleep + ' ' + $setting_sleep_after + ' 0')

    $setting_hibernate_after='9d7815a6-7ee4-497e-8888-515a05f02364'

    iex ('powercfg ' + $ac_value + ' ' + $plan_micros_pos + ' ' + $subgroup_sleep + ' ' + $setting_hibernate_after + ' 0')
    iex ('powercfg ' + $dc_value + ' ' + $plan_micros_pos + ' ' + $subgroup_sleep + ' ' + $setting_hibernate_after + ' 0')

$subgroup_display='7516b95f-f776-4464-8c53-06167f40cc99'

    $setting_dim_display_after='17aaa29b-8b43-4b94-aafe-35f64daaf1ee'

    iex ('powercfg ' + $ac_value + ' ' + $plan_micros_pos + ' ' + $subgroup_display + ' ' + $setting_dim_display_after + ' 0')
    iex ('powercfg ' + $dc_value + ' ' + $plan_micros_pos + ' ' + $subgroup_display + ' ' + $setting_dim_display_after + ' 0')

    $setting_turn_off_display_after='3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e'

    iex ('powercfg ' + $ac_value + ' ' + $plan_micros_pos + ' ' + $subgroup_display + ' ' + $setting_turn_off_display_after + ' 0')
    iex ('powercfg ' + $dc_value + ' ' + $plan_micros_pos + ' ' + $subgroup_display + ' ' + $setting_turn_off_display_after + ' 0')

    $setting_display_brighness='aded5e82-b909-4619-9949-f5d71dac0bcb'

    iex ('powercfg ' + $ac_value + ' ' + $plan_micros_pos + ' ' + $subgroup_display + ' ' + $setting_display_brighness + ' 100')
    iex ('powercfg ' + $dc_value + ' ' + $plan_micros_pos + ' ' + $subgroup_display + ' ' + $setting_display_brighness + ' 100')
