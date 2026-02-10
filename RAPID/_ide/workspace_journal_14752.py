# 2026-02-05T16:28:48.242924700
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

platform = client.get_component(name="motorDriver")
status = platform.build()

comp = client.get_component(name="motorDriver_SW")
comp.build()

vitis.dispose()

