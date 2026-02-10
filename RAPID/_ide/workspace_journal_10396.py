# 2025-12-02T12:16:10.190120500
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

platform = client.get_component(name="motorDriver")
status = platform.build()

comp = client.get_component(name="motorDriver_SW")
comp.build()

client.delete_component(name="motorDriver")

client.delete_component(name="motorDriver")

advanced_options = client.create_advanced_options_dict(dt_overlay="0")

platform = client.create_platform_component(name = "motorDriver",hw_design = "$COMPONENT_LOCATION/../top_wrapper.xsa",os = "standalone",cpu = "ps7_cortexa9_0",domain_name = "standalone_ps7_cortexa9_0",generate_dtb = False,advanced_options = advanced_options,compiler = "gcc")

status = platform.build()

vitis.dispose()

