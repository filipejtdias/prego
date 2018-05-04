#
# Be sure to run `pod lib lint Prego.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Prego'
  s.module_name      = 'Prego'
  s.version          = '0.1.0'
  
  s.ios.deployment_target   = '11.0'
  s.tvos.deployment_target  = '11.0'
  s.swift_version           = '4.1'
  
  s.summary          = 'Useful Extensions & Utils used on a daily basis by an iOS Developer'

  s.description      = <<-DESC
    Have you ever heard about DRY? 🤔
    This repository contains small utils and helpers that make our life easier.
                       DESC

  s.homepage         = 'https://github.com/filipejtdias/prego'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Filipe Dias' => 'filipejtdias@gmail.com' }
  s.source           = { :git => 'https://github.com/filipejtdias/prego.git', :tag => s.version.to_s }
  s.source_files     = 'Prego/Classes/**/*'
  s.frameworks       = ['Foundation', 'UIKit']
  
  subspec 'UI' do |sp|
      sp.source_files = 'Classes/UI'
  end
  
  subspec 'Log' do |sp|
      sp.source_files = 'Classes/Log'
  end
  
  subspec 'Operations' do |sp|
      sp.source_files = 'Classes/Operations'
  end
  
end
