import configparser
from configparser import ConfigParser
import glob
import os 

#to be checked later
# Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
# Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long
# Private Declare Function CharToOem Lib "user32" Alias "CharToOemA" (ByVal lpszSrc As String, ByVal lpszDst As String) As Long      

def INI_IO(Section,Key,Def,Read:bool,Pfad,SaveDef = False):
    
    vbNullChar=''

    IniFilename = 'filewatch.ini'
    
    

    if Pfad is None:
        if IniFilename == '':# inifilename declared as null

            Path = os.path.realpath(__file__) + vbNullChar#App.path==Apppath
        else:
            Path = IniFilename + vbNullChar
    else:
        Path = Pfad + vbNullChar

    Section = Section + vbNullChar

    if len(Key) == 1 and Key == vbNullChar:
        Key = vbNullChar
    else:
        Key  = Key + vbNullChar

    if Read and Def != '' and SaveDef:
        Mdef = Def
        Def = ''

    if len(str(Def)) == 1 and Def ==  vbNullChar:
        Def = vbNullChar
    elif Def != vbNullChar:
        Def = str(Def) + vbNullChar

    if Read:
        Buffer = [0]*1024
        config = configparser.ConfigParser()
        config.read('filewatch.ini')

        Läng = config.get('Section', 'Key')
        Länge = len(Läng)
        if Länge>0:
            INI_IO = Buffer[1:Länge]
            if SaveDef and INI_IO == '' and Mdef != '':
                INI_IO = Mdef
                config.set(Section, Key,Mdef + vbNullChar,Path)
        else:
            config.set(Section, Key,Path)
        return Läng            


def ch(Typ, Wert, STR_Return):

    vbNullChar=''

    if Typ == "LTN":
        ch  = [None if Wert == "" else Wert]
    elif Typ == "LTO":
        ch  = [None if Wert == "" else Wert]
    elif Typ == "NTL":
        ch = ["" if Wert is None else Wert]
    elif Typ == "NTO":
        ch =[0 if Wert is None else Wert]
    elif Typ == "KTP":
        if Wert is None:
            ch = None
        elif Wert=="":
            ch = None
        else:
            STR = CCur(Wert)
            STR = STR.replace(".", " ") 
            STR = STR.replace(",", ".")
            ch  = STR.strip()
    elif Typ == "CTO":
        Q = Wert + vbNullChar
        z = len(Q), " "
        ch = z[1:len(z) - 1]
    elif Typ == "CDT":
        Datum = Wert
        ch = Datum

    else:
        ch = Wert

    if STR_Return is not None:
        if STR_Return is True:
            if ch is None:
                ch = "Null"    

                     

        


