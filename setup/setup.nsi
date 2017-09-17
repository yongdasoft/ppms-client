;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  ppms��װ��
;  mrlong.cn
; ��������:������  ����ʱ��:2017-9-17
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

!define OUTDIR_NAME ".\"
!define PRODUCT_NAME "�����ѯ��Ŀ����ϵͳ"
!define PRODUCT_VERSION "1.0.1"
!define PRODUCT_PUBLISHER "�������"
!define PRODUCT_DIR_REGKEY "Software\yongdasoft\ppms\${PRODUCT_NAME}\�����ѯ��Ŀ����ϵͳ.exe"
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
BrandingText /TRIMRIGHT "���������ֻ����á�"
; Welcome page
!insertmacro MUI_PAGE_WELCOME
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\�����ѯ��Ŀ����ϵͳ.exe"

!insertmacro MUI_PAGE_FINISH

; Language files
!insertmacro MUI_LANGUAGE "SimpChinese"

; MUI end ---------------------------------------------------------

Name "${PRODUCT_NAME}"
OutFile "${OUTDIR_NAME}�������-${PRODUCT_NAME}.exe"
InstallDir "$PROGRAMFILES\�������\${PRODUCT_NAME}"
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


  
  
 ;����ݼ�
  CreateDirectory "$SMPROGRAMS\yondasoft\${PRODUCT_NAME}"
  CreateShortCut  "$SMPROGRAMS\yondasoft\${PRODUCT_NAME}\${PRODUCT_NAME}.lnk" "$INSTDIR\�����ѯ��Ŀ����ϵͳ.exe"
  CreateShortCut  "$DESKTOP\${PRODUCT_NAME}.lnk" "$INSTDIR\�����ѯ��Ŀ����ϵͳ.exe"
SectionEnd

Section -AdditionalIcons
  CreateShortCut "$SMPROGRAMS\yondasoft\${PRODUCT_NAME}\ж��${PRODUCT_NAME}.lnk" "$INSTDIR\ж��.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\ж��.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\�����ѯ��Ŀ����ϵͳ.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\�����ѯ��Ŀ����ϵͳ.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) �ѳɹ��ش���ļ�����Ƴ���"
FunctionEnd


Section Uninstall
 
  
  Delete "$INSTDIR\�����ѯ��Ŀ����ϵͳ.exe"
  Delete "$INSTDIR\*.*"
 
 
  Delete "$INSTDIR\cache\*.*"
  RMDir /r "$INSTDIR\cache"

  Delete "$INSTDIR\locales\*.*"
  RMDir /r "$INSTDIR\locales"

  Delete "$INSTDIR\temp\*.*"
  RMdir "$INSTDIR\temp"

  RMdir "$INSTDIR"


  
  ;ɾ��ע���
  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  
  ;ɾ����ݼ�
  Delete "$SMPROGRAMS\mrlong.cn\${PRODUCT_NAME}\${PRODUCT_NAME}.lnk" 
  Delete "$DESKTOP\${PRODUCT_NAME}.lnk" 
  Delete "$SMPROGRAMS\mrlong.cn\${PRODUCT_NAME}\ж��${PRODUCT_NAME}.lnk"
  SetAutoClose false
SectionEnd