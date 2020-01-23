#pragma once

#include "wx/wx.h"
#include <vector>
#include <string>

class Bow {
	std::string ime;
	float avgPhys;
	float aps;

public:
	Bow(std::string name, float phys, float aSpeed) { ime = name; avgPhys = phys; aps = aSpeed; };
	~Bow() {};
	std::string izpis() { return ime;  }
	float getVal() { return avgPhys; }
};

class cMain : public wxFrame
{
public:
	cMain();
	~cMain();

public:
	wxButton* m_btn1 = nullptr;
	wxTextCtrl* m_text1 = nullptr;
	wxListBox* m_list1 = nullptr;
	wxMessageDialog* m_message1 = nullptr;
	void OnButtonClicked(wxCommandEvent& evt);
	void take_params(wxString file, std::vector<Bow>);

	wxDECLARE_EVENT_TABLE();
};

