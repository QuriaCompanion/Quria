//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <isar_flutter_libs/isar_flutter_libs_plugin.h>
#include <protocol_handler/protocol_handler_plugin.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  IsarFlutterLibsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("IsarFlutterLibsPlugin"));
  ProtocolHandlerPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("ProtocolHandlerPlugin"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
