#include "cMain.h"
#include <iostream>
#include <vector>
#include <string>
#include <sstream>

wxBEGIN_EVENT_TABLE(cMain, wxFrame)
    EVT_BUTTON(10001, OnButtonClicked)
wxEND_EVENT_TABLE()

std::vector<Bow> bowie;

cMain::cMain() : wxFrame(nullptr, wxID_ANY, "TITLE", wxPoint(200, 200), wxSize(500, 500)) {
	m_btn1 = new wxButton(this, 10001, "Click Me", wxPoint(150, 50), wxSize(150, 50));
	m_text1 = new wxTextCtrl(this, wxID_ANY, "", wxPoint(100, 120), wxSize(300, 300), wxTE_MULTILINE);
}

cMain::~cMain() {

}


void cMain::OnButtonClicked(wxCommandEvent& evt) {
    take_params(m_text1->GetValue(), bowie);
	evt.Skip();
}

void cMain::take_params(wxString file, std::vector<Bow> bowie) {
        float gX = 0, gY = 0, gZ = 0;
        std::string n = "", m = "", prelom, dejansko;
        dejansko = std::string(file.mb_str());
        int len = 0, pos2;
        bool rarity = false;
        size_t pos;
        std::istringstream iss(dejansko);
        for (std::string test; std::getline(iss, test); ) {
            if (!test.find("Physical")) {
                n = test;
                n = n.substr(17, ':');
                pos = n.find('(');
                n = n.substr(0, pos);
                pos = n.find('-');
                gX = (stof(n.substr(0, pos)) + stof(n.substr(pos + 1, n.length()))) / 2;
            }
            else if (!test.find("Attacks")) {
                m = test;
                m = m.substr(20, ':');
                pos = m.find('(');
                m = m.substr(0, pos);
                gZ = stof(m);
                bowie.push_back(Bow(prelom, gX, gZ));
                prelom = "";
                gX = 0;
                gZ = 0;
            }
            else if (!test.find("Rarity:")) {
                rarity = true;
            }
            else if (rarity == true) {
                prelom = test;
                rarity = false;
            }
        }
        for (int i = 0; i < size(bowie); i++) {
            float primerjaj = 0;
            if (bowie.at(i).getVal() > primerjaj) {
                primerjaj = bowie.at(i).getVal();
                pos2 = i;
            }
        }
        m_message1 = new wxMessageDialog(NULL, bowie.at(pos2).izpis(), wxT("Best bow"), wxOK);
        m_message1->ShowModal();
        delete m_message1;
}
