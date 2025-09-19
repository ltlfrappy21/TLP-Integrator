# IOC Vetting & Source Verification SOP (CTI Pipeline)
## Effective: 2025-09-19
## Classification: TLP:CLEAR

---

## 1. IOC Extraction Response Policy

When an Indicator of Compromise (IOC) is extracted (e.g., NPM package name, domain, IP, hash, etc.), the following workflow **must be executed immediately**:

### Step 1: Multi-Source Cross-Verification
- Query multiple open-source intelligence platforms:
  - Blogs: JFrog, Snyk, CrowdStrike, Unit 42, etc.
  - Community: Reddit, Hacker News, forums
  - Standards: CISA KEV, NVD, MITRE ATT&CK, GitHub Advisories
- Log all matched references with:
  - `source_type`: primary disclosure / redistributor / secondary analysis / unverified
  - `source_url`: canonical/public URL
  - `collection_timestamp`
  - `reference_quality`: (HIGH, MEDIUM, LOW) or 5-point scale

### Step 2: Circular Reporting Detection
- Trace source citation lineage
  - Identify if multiple reports originate from the same disclosure (e.g., JFrog ➝ Snyk ➝ Twitter ➝ Reddit)
- Document this structure in the IOC metadata

### Step 3: Deduplication & Prioritization
- Normalize and deduplicate IOCs
- Identify "Unique + Primary" indicators for enrichment/triage
- Flag "Circular-only" indicators as lower fidelity for ops use

---

## 2. Documentation & Reporting Requirements

- Record all vetted indicators into:
  - `Notion/Indicator Registry`
  - `GitHub /intel/iocs/`
  - `Evidence Registry (OSCAL-formatted where possible)`
- Tag with:
  - TLP classification (e.g., TLP:GREEN)
  - Source confidence
  - Validation status

---

## 3. GitHub Automation Flow (For Integration)

- Filename: `/intel/iocs/ioc-vetting-sop.md`
- Auto-linked with `/intel/evidence/registry.csv`
- Automatically included in CTI Weekly Digest Generator

---

## Sample Entry Format (CSV):
| Indicator | IOC Type | TLP | Source URL | Source Quality | Circularity | Notes |
|----------|----------|-----|------------|----------------|-------------|-------|
| `rxnt-healthchecks-nestjs` | NPM Package | GREEN | https://jfrog.com/... | High | No | Verified by JFrog |

---

Maintained by: `TOAL_ShOp CTI Pipeline`  
Last updated: 2025-09-19
