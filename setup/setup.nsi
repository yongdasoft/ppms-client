;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  ppms安装包
;  mrlong.cn
; 开发作者:龙仕云  创建时间:2017-9-17
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!define OUTDIR_NAME ".\"
!define PRODUCT_NAME "造价咨询项目管理系统"
!define PRODUCT_VERSION "1.0.1"
!define PRODUCT_PUBLISHER "永大软件"
!define PRODUCT_DIR_REGKEY "Software\yongdasoft\ppms\${PRODUCT_NAME}\造价咨询项目管理系统.exe"
!define PRODUCT_UNINST_KEY "Software\yongdasoft\ppms\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define APPDIR "..\filedata"

!include "MUI2.nsh"
;--------------------------------------------------------
; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\orange-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\orange-uninstall.ico"
!define MUI_WELCOMEFINISHPAGE_BITMAP ".\orange.bmp"
BrandingText /TRIMRIGHT "永大软件，只做最好。"
; Welcome page
!insertmacro MUI_PAGE_WELCOME
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\造价咨询项目管理系统.exe"

!insertmacro MUI_PAGE_FINISH

; Language files
!insertmacro MUI_LANGUAGE "SimpChinese"

; MUI end ---------------------------------------------------------

Name "${PRODUCT_NAME}"
OutFile "${OUTDIR_NAME}永大软件-${PRODUCT_NAME}.exe"
InstallDir "$PROGRAMFILES\永大软件\${PRODUCT_NAME}"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

RequestExecutionLevel admin

!define SRCDIR "."
Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite on
  file "${APPDIR}\*.*"
 
  
  SetOutPath "$INSTDIR\locales"
  SetOverwrite on
  file "${APPDIR}\locales\*.*"


  
  
 ;建快捷键
  CreateDirectory "$SMPROGRAMS\yondasoft\${PRODUCT_NAME}"
  CreateShortCut  "$SMPROGRAMS\yondasoft\${PRODUCT_NAME}\${PRODUCT_NAME}.lnk" "$INSTDIR\造价咨询项目管理系统.exe"
  CreateShortCut  "$DESKTOP\${PRODUCT_NAME}.lnk" "$INSTDIR\造价咨询项目管理系统.exe"
SectionEnd

Section -AdditionalIcons
  CreateShortCut "$SMPROGRAMS\yondasoft\${PRODUCT_NAME}\卸载${PRODUCT_NAME}.lnk" "$INSTDIR\卸载.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\卸载.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\造价咨询项目管理系统.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\造价咨询项目管理系统.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) 已成功地从你的计算机移除。"
FunctionEnd


Section Uninstall
 
  
  Delete "$INSTDIR\造价咨询项目管理系统.exe"
  Delete "$INSTDIR\*.*"
 
 
  Delete "$INSTDIR\cache\*.*"
  RMDir /r "$INSTDIR\cache"

  Delete "$INSTDIR\locales\*.*"
  RMDir /r "$INSTDIR\locales"

  Delete "$INSTDIR\temp\*.*"
  RMdir "$INSTDIR\temp"

  RMdir "$INSTDIR"


  
  ;删除注册表
  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  
  ;删除快捷键
  Delete "$SMPROGRAMS\mrlong.cn\${PRODUCT_NAME}\${PRODUCT_NAME}.lnk" 
  Delete "$DESKTOP\${PRODUCT_NAME}.lnk" 
  Delete "$SMPROGRAMS\mrlong.cn\${PRODUCT_NAME}\卸载${PRODUCT_NAME}.lnk"
  SetAutoClose false
SectionEnd