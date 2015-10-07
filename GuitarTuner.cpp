// DirectNoise.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include "Windows.h"
#include "Commdlg.h"
#include "stdlib.h"
#include "stdio.h"
#include "GuitarTuner.h"
#define INITGUID
#include "mmsystem.h"
#define MAX_LOADSTRING 100

// Global Variables:
HINSTANCE hInst;								// current instance
TCHAR szTitle[MAX_LOADSTRING];					// The title bar text
TCHAR szWindowClass[MAX_LOADSTRING];			// the main window class name
HMIDIOUT      outHandle;

// Forward declarations of functions included in this code module:
BOOL				InitInstance(HINSTANCE, int);
LRESULT CALLBACK	WndProc(HWND, UINT, WPARAM, LPARAM);
LRESULT CALLBACK	About(HWND, UINT, WPARAM, LPARAM);
BOOL CALLBACK GuitarTuner( HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam);
BOOL done = FALSE;
int NoteSelection = 0;

int APIENTRY _tWinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPTSTR    lpCmdLine,
                     int       nCmdShow)
{
 	// TODO: Place code here.
	MSG msg;
	HACCEL hAccelTable;

	// End Dmusic and COM setup

	// Perform application initialization:
	//if (!InitInstance (hInstance, nCmdShow)) 
	//{
	//	return FALSE;
	//}

	hAccelTable = LoadAccelerators(hInstance, (LPCTSTR)IDC_DIRECTNOISE);

	HWND hWnd = CreateDialog(hInst, (LPCTSTR)IDD_GUITARTUNER, NULL, (DLGPROC)GuitarTuner);
	ShowWindow( hWnd, nCmdShow );
	HICON hIcon = (HICON)LoadImage(hInstance, MAKEINTRESOURCE(IDI_ICON1), IMAGE_ICON, 32, 32, LR_DEFAULTSIZE);
	SendMessage(hWnd, WM_SETICON, ICON_BIG, (LPARAM)hIcon);

	unsigned long result;

	/* Open the MIDI Mapper */
	result = midiOutOpen(&outHandle, (UINT)-1, 0, 0, CALLBACK_WINDOW);
	if (result)
	{
		printf("There was an error opening MIDI Mapper!\r\n");
	}

	// Default to starting with the low E.
	CheckDlgButton( hWnd, IDC_LOW_E, BST_CHECKED );

	// Main message loop:
	while (!done && GetMessage(&msg, NULL, 0, 0)) 
	{
		if ( hWnd == 0 || !IsDialogMessage( hWnd, &msg)) 
		{
			TranslateMessage(&msg);
			DispatchMessage(&msg);
		}
	}

	// Make sure all notes are off.
	midiOutShortMsg(outHandle, 0x00007BB0);	

	/* Close the MIDI device */
	if( outHandle )
		midiOutClose(outHandle);

	return 0;
}



//
//  FUNCTION: WndProc(HWND, unsigned, WORD, LONG)
//
//  PURPOSE:  Processes messages for the main window.
//
//  WM_COMMAND	- process the application menu
//  WM_PAINT	- Paint the main window
//  WM_DESTROY	- post a quit message and return
//
//
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	int wmId, wmEvent;
	PAINTSTRUCT ps;
	HDC hdc;

	switch (message) 
	{
	case WM_COMMAND:
		wmId    = LOWORD(wParam); 
		wmEvent = HIWORD(wParam); 
		// Parse the menu selections:
		switch (wmId)
		{
		case IDM_EXIT:
			DestroyWindow(hWnd);
			done = true;
			break;
		/*
		case IDC_LOW_E:
		case IDC_A:
		case IDC_D:
		case IDC_G:
		case IDC_B:
		case IDC_HIGH_E:
			CheckRadioButton( hWnd, IDC_LOW_E, IDC_HIGH_E, wmId );
			NoteSelection = wmId;
			break;
		*/
		default:
			return DefWindowProc(hWnd, message, wParam, lParam);
		}
		break;
	case WM_PAINT:
		hdc = BeginPaint(hWnd, &ps);
		// TODO: Add any drawing code here...
		EndPaint(hWnd, &ps);
		break;
	case WM_SYSCOMMAND:
		if( wParam == SC_CLOSE )
		{
			DestroyWindow(hWnd);
			done = true;
		}
		break;
	case WM_CLOSE:
		DestroyWindow(hWnd);
		done = true;
		break;
	case WM_DESTROY:
		done = true;
		// DestroyWindow(hWnd);
		PostQuitMessage(0);
		break;
	default:
		return DefWindowProc(hWnd, message, wParam, lParam);
	}
	return 0;
}

// Message handler for about box.
LRESULT CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
	case WM_INITDIALOG:
		return TRUE;

	case WM_COMMAND:
		if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL) 
		{
			EndDialog(hDlg, LOWORD(wParam));
			return TRUE;
		}
		break;
	}
	return FALSE;
}

BOOL CALLBACK GuitarTuner( HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch( message )
	{
	case WM_INITDIALOG:
		return TRUE;

	case WM_COMMAND:
		if( LOWORD(wParam) == IDEXIT )
		{
			DestroyWindow( hDlg );
			done = true;
			return TRUE;
		}
		if( LOWORD(wParam) == IDC_STOP )
		{
			// Make sure all notes are off.
			midiOutShortMsg(outHandle, 0x00007BB0);	
			return TRUE;
		}
		else if(LOWORD( wParam) == IDC_PLAYMIDI )
		{
			// Steel string Guitar: #26
			// ORGAN                          GUITAR
			// 17   Drawbar Organ             25   Nylon String Guitar
			// 18   Percussive Organ          26   Steel String Guitar
			// 19   Rock Organ                27   Electric Jazz Guitar
			// 20   Church Organ              28   Electric Clean Guitar
			// 21   Reed Organ                29   Electric Muted Guitar
			// 22   Accoridan                 30   Overdriven Guitar
			// 23   Harmonica                 31   Distortion Guitar
			// 24   Tango Accordian           32   Guitar Harmonics
			midiOutShortMsg(outHandle, 0x00001AC0);

			if( IsDlgButtonChecked( hDlg, IDC_LOW_E ))
			{
				// E = 40
				midiOutShortMsg(outHandle, 0x007F2890);
			}
			else if( IsDlgButtonChecked( hDlg, IDC_A ))
			{
				// A = 45
				midiOutShortMsg(outHandle, 0x007F2D90);
			}
			else if( IsDlgButtonChecked( hDlg, IDC_D ))
			{
				// D = 50
				midiOutShortMsg(outHandle, 0x007F3290);
			}
			else if( IsDlgButtonChecked( hDlg, IDC_G ))
			{
				// G = 55
				midiOutShortMsg(outHandle, 0x007F3790);
			}
			else if( IsDlgButtonChecked( hDlg, IDC_B ))
			{
				// B = 59
				midiOutShortMsg(outHandle, 0x007F3B90);
			}
			else if( IsDlgButtonChecked( hDlg, IDC_HIGH_E ))
			{
				// E = 64
				midiOutShortMsg(outHandle, 0x007F4090);
			}
		}
		return TRUE;
		break;
	}

	return FALSE;
}
