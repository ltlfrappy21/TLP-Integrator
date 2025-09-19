# Analyzer that classifies TLP level based on IOC enrichment

def analyze_ioc(ioc):
    if 'github.com' in ioc or 'postinstall' in ioc:
        return 'TLP:RED'
    return 'TLP:AMBER'