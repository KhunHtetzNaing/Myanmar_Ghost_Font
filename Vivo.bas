Type=Activity
Version=6.8
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.
	Dim tb As Label
	Dim share,About As Button
	Dim sbg,abg As BitmapDrawable
	Dim mm As Typeface : mm = mm.LoadFromAssets("ghost.ttf")
	Dim td As Label
	
	Dim b1,b2,b3,b4,b5 As Button
	Dim b1bg,b2bg,b3bg,b4bg,b5bg As ColorDrawable
	
	Dim B As AdView
	Dim I As InterstitialAd
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	'Activity.LoadLayout("Layout1")
	Activity.Color = Colors.White
	tb.Initialize("")
	tb.Color = Colors.rgb(103, 58, 183)
	tb.Text = "Vivo"
	tb.TextColor = Colors.White
	tb.TextSize = 20
	tb.Gravity = Gravity.CENTER
	tb.Typeface = Typeface.DEFAULT_BOLD
	Activity.AddView(tb,0%x,0%y,100%x,55dip)
	
	About.Initialize("about")
	abg.Initialize(LoadBitmap(File.DirAssets,"about.png"))
	About.Background = abg
	About.Gravity = Gravity.FILL
	Activity.AddView(About,10dip,12.5dip,30dip,30dip)
	
	share.Initialize("share")
	sbg.Initialize(LoadBitmap(File.DirAssets,"share.png"))
	share.Background = sbg
	share.Gravity = Gravity.FILL
	Activity.AddView(share,100%x-40dip,12.5dip,30dip,30dip)
	
	td.Initialize("")
	td.Text = "*ထည့္သြင္းမည္*  ကိုႏွိပ္ပါ။ ၿပီးရင္ေအာက္ပါ *ေဖာင့္ေျပာင္းမည္(၁)* ကိုႏွိပ္ပါ Ghost.txj (သို႔) Ghost.itz ကိုဖြင့္ၿပီး Apply လုပ္ေပးလိုက္ပါ မရခဲ့ရင္ *ေဖာင့္ေျပာင္းမည္(၂)* ကိုႏွိပ္ၿပီး Myanmar Ghost Font နာမည္နဲ႔ Theme ကိုေရြးေပးလိုက္ပါ။ နဂိုမူလေဖာင့္ကိုျပန္ထားခ်င္ရင္ *ေဖာင့္ေျပာင္းမည္(၂)* ကိုႏွိပ္ၿပီး Default ကိုျပန္ေရြးထားနိုင္ပါတယ္။"
	td.Gravity = Gravity.CENTER
	td.Typeface = mm
	td.TextSize = 15
	td.TextColor = Colors.Black
	Activity.AddView(td,0%x,62dip,100%x,160dip)
	
	b1bg.Initialize(Colors.rgb(0, 150, 136),15)
	b1.Initialize("b1")
	b1.TextSize = 15
	b1.Text = "ထည့္သြင္းမည္"
	b1.Typeface = mm
	b1.Background = b1bg
	Activity.AddView(b1,50%x-100dip,td.Height+td.Top+7dip,200dip,50dip)
	
	b2bg.Initialize(Colors.Black,15)
	b2.Initialize("b2")
	b2.Text = "ေဖာင့္ေျပာင္းမည္(၁)"
	b2.TextSize = 15
	b2.Typeface = mm
	b2.Background = b2bg
	Activity.AddView(b2,50%x-100dip,b1.Top+b1.Height+7dip,200dip,50dip)
	
	b3bg.Initialize(Colors.rgb(103, 58, 183),15)
	b3.Initialize("b3")
	b3.Text = "ေဖာင့္ေျပာင္းမည္(၂)"
	b3.Typeface = mm
	b3.TextSize = 15
	b3.Background = b3bg
	Activity.AddView(b3,50%x-100dip,b2.Top+b2.Height+7dip,200dip,50dip)
	
	b4bg.Initialize(Colors.rgb(63, 81, 181),15)
	b4.Initialize("b4")
	b4.Text = "ေဖာင့္ေျပာင္းမည္(၃)"
	b4.TextSize = 15
	b4.Background = b4bg
	b4.Typeface = mm
	Activity.AddView(b4,50%x-100dip,b3.Top+b3.Height+7dip,200dip,50dip)
	
	b5bg.Initialize(Colors.rgb(76, 175, 80),15)
	b5.Initialize("b5")
	b5.Text = "ထည့္သြင္းအသုံးျပုနည္း"
	b5.TextSize = 15
	b5.Background = b5bg
	b5.Typeface = mm
	Activity.AddView(b5,50%x-100dip,b4.Height+b4.Top+7dip,200dip,50dip)
	
	B.Initialize("B","ca-app-pub-4173348573252986/4337458552")
	Dim height As Int
	If GetDeviceLayoutValues.ApproximateScreenSize < 6 Then
		If 100%x > 100%y Then height = 32dip Else height = 50dip
	Else
		height = 90dip
	End If
	Activity.AddView(B, 0dip, 100%y - height, 100%x, height)
	B.LoadAd
	Log(B)
	
	I.Initialize("I","ca-app-pub-4173348573252986/5814191753")
	I.LoadAd
End Sub

Sub b1_Click
	Dim file1 As List
	Dim dd As String
	file1 = File.ListFiles(File.DirRootExternal & "/Vivo Myanmar Font")
	file1.Sort(True)
	
	For n = 0 To file1.Size -1
		dd =  file1.Get(n)
		Log(dd)
		File.Delete(File.DirRootExternal & "/Vivo Myanmar Font",dd)
	Next
	
	If File.Exists(File.DirRootExternal & "/Vivo Myanmar Font","") = False Then File.MakeDir(File.DirRootExternal,"Vivo Myanmar Font")
	If File.Exists(File.DirRootExternal & "/Vivo Myanmar Font","ghost.txj") = True Then File.Delete(File.DirRootExternal,"Vivo Myanmar Font/ghost.txj")
	File.Copy(File.DirAssets,"ghost.txj",File.DirRootExternal & "/Vivo Myanmar Font","ghost.txj")
	
	If File.Exists(File.DirRootExternal & "/Vivo Myanmar Font","ghost.itz") = True Then File.Delete(File.DirRootExternal,"Vivo Myanmar Font/ghost.itz")
	File.Copy(File.DirAssets,"ghost.itz",File.DirRootExternal & "/Vivo Myanmar Font","ghost.itz")
	Msgbox("Installed" & CRLF & "Now! you can change font!","Attention!")
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b2_Click
	Dim p As Phone
	Dim up As String = File.DirRootExternal & "/.dwd/c/o/m/b/b/k/t/h/e/m/e/F"
	Dim down As String = File.DirRootExternal & "/Download/i Theme/Font"
	
	Try
		If p.SdkVersion > 22 Then
			ToastMessageShow("This is After 6.0",True)
			If File.Exists(up,"") = False Then
				File.MakeDir(File.DirRootExternal,".dwd/c/o/m/b/b/k/t/h/e/m/e/F")
			End If
			File.Copy(File.DirAssets,"ghost.itz",File.DirRootExternal & "/.dwd/c/o/m/b/b/k/t/h/e/m/e/F","ghost.itz")
			If File.Exists(File.DirRootExternal & "/.dwd/c/o/m/b/b/k/t/h/e/m/e/F","ghost.itz") = True Then
				Try
					Dim ii As Intent
					ii.Initialize("", "")
					ii.SetComponent("com.bbk.theme/.mixmatch.font.FontMain")
					StartActivity(ii)
				Catch
					Dim ii As Intent
					Dim pm As PackageManager
					ii=pm.GetApplicationIntent("com.bbk.theme")
					StartActivity(ii)
				End Try
			Else
				Msgbox("Error","")
			End If
	
		Else
			ToastMessageShow("This is before 6.0",True)
			If File.Exists(down,"") = False Then
				File.MakeDir(File.DirRootExternal,"Download/i Theme/Font")
			End If
			File.Copy(File.DirAssets,"ghost.itz",File.DirRootExternal & "/Download/i Theme/Font","ghost.itz")
			If File.Exists(File.DirRootExternal & "/Download/i Theme/Font","ghost.itz") = True Then
				Try
					Dim ii As Intent
					ii.Initialize("", "")
					ii.SetComponent("com.bbk.theme/.mixmatch.font.FontMain")
					StartActivity(ii)
				Catch
					Dim ii As Intent
					Dim pm As PackageManager
					ii=pm.GetApplicationIntent("com.bbk.theme")
					StartActivity(ii)
				End Try
			End If
		End If
	Catch
		Msgbox("Your device is not Vivo","Error!!!")
	End Try
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b3_Click
	Try
	If File.Exists(File.DirRootExternal & "/Download/i Theme/Font","") = False Then File.MakeDir(File.DirRootExternal,"Download/i Theme/Font")
		If File.Exists(File.DirRootExternal & "/Download/i Theme/Font","ghost.txj") = True Then File.Delete(File.DirRootExternal,"Download/i Theme/Font/ghost.txj")
		File.Copy(File.DirAssets,"ghost.txj",File.DirRootExternal & "/Download/i Theme/Font","ghost.txj")
	
		If File.Exists(File.DirRootExternal & "/Download/i Theme/Font","ghost.itz") = True Then File.Delete(File.DirRootExternal,"Download/i Theme/Font/ghost.itz")
		File.Copy(File.DirAssets,"ghost.itz",File.DirRootExternal & "/Download/i Theme/Font","ghost.itz")
	Try
		Dim ii As Intent
		ii.Initialize("", "")
		ii.SetComponent("com.bbk.theme/.mixmatch.font.FontMain")
		StartActivity(ii)
	Catch
		Dim ii As Intent
		Dim pm As PackageManager
		ii=pm.GetApplicationIntent("com.bbk.theme")
		StartActivity(ii)
	End Try
	Catch
		Msgbox("your phone is not Vivo","Error")
		End Try
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b4_Click
	Try
		Dim ii As Intent
		ii.Initialize(ii.ACTION_VIEW, "file://" &  File.DirRootExternal&"/Vivo Myanmar Font" )
		ii.SetType( "resource/folder" )
		StartActivity(ii)
	Catch
		StartActivity(Vivo1False)
	End Try
	If I.Ready Then I.Show Else I.LoadAd
End Sub

Sub b5_CLick
	StartActivity(VivoGuide)
	If I.Ready Then I.Show Else I.LoadAd
End Sub


Sub about_Click
	StartActivity(Ab0ut)
End Sub

Sub share_Click
	Dim ShareIt As Intent
	Dim copy As BClipboard
	copy.clrText
	copy.setText("#MyanmarGhostFont App! Beautiful Myanmar Zawgyi Font Style!	You can Use in Samung, Oppo,Vivo, Huawei (EMUI) and Xiaomi (MIUI) without Root Access!!!! Download Free at : http://www.takhon.com/tech/?s=Myanmar+Ghost+Font")
	ShareIt.Initialize (ShareIt.ACTION_SEND,"")
	ShareIt.SetType ("text/plain")
	ShareIt.PutExtra ("android.intent.extra.TEXT",copy.getText)
	ShareIt.PutExtra ("android.intent.extra.SUBJECT","Get Free!!")
	ShareIt.WrapAsIntentChooser("Share App Via...")
	StartActivity (ShareIt)
End Sub

'Banner Ads
Sub B_FailedToReceiveAd (ErrorCode As String)
	Log("B failed: " & ErrorCode)
End Sub
Sub B_ReceiveAd
	Log("B received")
End Sub

Sub B_AdScreenDismissed
	Log("B Dismissed")
End Sub

'Interstitial Ads
Sub I_AdClosed
	I.LoadAd
End Sub

Sub I_ReceiveAd
	Log("I Received")
End Sub

Sub I_FailedToReceiveAd (ErrorCode As String)
	Log("I not Received - " &"Error Code: "&ErrorCode)
	I.LoadAd
End Sub

Sub I_adopened
	Log("I Opened")
	I.LoadAd
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

