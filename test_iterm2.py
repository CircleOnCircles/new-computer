import iterm2

# async def main(connection):
#     app = await iterm2.async_get_app(connection)
#     window = app.current_terminal_window
#     if window is not None:
#         await window.async_create_tab()
#     else:
#         print("No current window")

# iterm2.run_until_complete(main)

app = iterm2.App(iterm2.connection)