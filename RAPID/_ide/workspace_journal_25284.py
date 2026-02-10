# 2026-01-28T14:22:43.369070400
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

platform = client.get_component(name="motorDriver")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../top_wrapper.xsa")

status = platform.build()

vitis.dispose()

