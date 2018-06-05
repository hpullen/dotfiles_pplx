void getEntries(TString filename, TString cut = "") {

    // Open file and get tree
    TFile * file = TFile::Open(filename, "READ");
    TTree * tree = (TTree*)file->Get("DecayTree");
    std::cout << tree->GetEntries(cut) << std::endl;

}
