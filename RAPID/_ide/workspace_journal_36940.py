# 2026-02-10T14:48:22.671033600
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

platform = client.get_component(name="motorDriver")
status = platform.build()

comp = client.get_component(name="motorDriver_SW")
comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

comp.build()

vitis.dispose()

