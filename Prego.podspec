Pod::Spec.new do |s|
  s.name        = 'Prego'
  s.module_name = 'Prego'
  s.version     = '0.1.3'
  
  s.ios.deployment_target   = '11.0'
  s.tvos.deployment_target  = '11.0'
  s.swift_version           = '4.1'
  
  s.summary = 'Useful Extensions & Utils used on a daily basis by an iOS Developer'

  s.description      = <<-DESC
    Have you ever heard about DRY? 🤔
    This repository contains small utils and helpers that make our life easier.
                       DESC

  s.homepage         = 'https://github.com/filipejtdias/prego'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Filipe Dias' => 'filipejtdias@gmail.com' }
  s.source           = { :git => 'https://github.com/filipejtdias/prego.git', :tag => s.version.to_s }
  s.frameworks       = ['Foundation', 'UIKit']
  
  s.subspec 'Extensions' do |sp|
      sp.source_files = 'Sources/Extensions/**/*'
  end
  
  s.subspec 'Log' do |sp|
      sp.source_files = 'Sources/Log'
  end
  
  s.subspec 'Operations' do |sp|
      sp.source_files = 'Sources/Operations'
  end

  s.subspec 'Utils' do |sp|
      sp.source_files = 'Sources/Utils'
  end

  s.subspec 'Enums' do |sp|
      sp.source_files = 'Sources/Enums'
  end
  
end
