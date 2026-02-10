# 2026-01-20T16:22:30.470159100
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

platform = client.get_component(name="motorDriver")
status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../top_wrapper.xsa")

status = platform.build()

status = platform.build()

comp = client.get_component(name="motorDriver_SW")
comp.build()

status = platform.update_hw(hw_design = "$COMPONENT_LOCATION/../top_wrapper.xsa")

status = platform.build()

vitis.dispose()

