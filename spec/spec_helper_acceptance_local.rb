# frozen_string_literal: true

def sut_module_path(module_regex)
  modules = JSON.parse(run_shell('puppet module list --render-as json').stdout)
  test_module_info = modules['modules_by_path'].values.flatten.find { |mod_info| mod_info =~ module_regex }
  test_module_info.match(%r{\(([^)]*)\)})[1]
end

def sut_tmp_path
  # TODO: Linux only
  '/tmp/'
end
