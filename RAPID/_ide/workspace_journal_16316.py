# 2025-12-02T14:45:34.759237600
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

platform = client.get_component(name="motorDriver")
status = platform.build()

status = platform.build()

comp = client.get_component(name="motorDriver_SW")
comp.build()

vitis.dispose()

