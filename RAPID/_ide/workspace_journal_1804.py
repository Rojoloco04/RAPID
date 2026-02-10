# 2026-02-03T15:46:47.219315900
import vitis

client = vitis.create_client()
client.set_workspace(path="RAPID")

platform = client.get_component(name="motorDriver")
status = platform.build()

vitis.dispose()

vitis.dispose()

vitis.dispose()

