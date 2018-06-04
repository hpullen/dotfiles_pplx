void getEntries(TString filename, TString treename = "DecayTree") {

    // Open file and get tree
    TFile * file = TFile::Open(filename, "READ");
    TTree * tree = (TTree*)file->Get(treename);
    std::cout << tree->GetEntries() << std::endl;

}
