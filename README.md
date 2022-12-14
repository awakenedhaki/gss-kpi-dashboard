# Key Performance Index Survey Dashboard

This repository is focused on the development of a Key Performance Index (KPI) Dashboard for the Graduate Student Society (GSS) based at the University of British Columbia.

The GSS is a student led organization that is, in part, composed of **standing** and **ad-hoc** committees. GSS committees is composed to a **Chair**, **Council Member**, and **Ordinary Member**, which meet at a self-determined frequency to meet their function.

## What data is needed?

At a high-level, to determine if the GSS committees are fulfilling their mandates, the  GSS has established the Governance & Accountability (G&A) Committee which meets with other committee Chairs on a quarterly basis. The meeting with the G&A members are to establish progress on committee objectives, and identify bottlenecks.

The G&A committee also established an automated data collection strategy for more regular check-ins with GSS committees. The data collection strategy is composed of a Microsoft Forms which are to be filled by a member of the surveyed committee on a monthly basis.

The data being collected is:
| Variable | Data Type |
|---|---|
| Data of Entry | `DATE` |
| Council Period | `DATE` |
| Committee Name | `ENUM(..TEXT..)` |
| Submitter Committee Role | `ENUM(..TEXT..)` |
| Expected Number of Meetings | `INT` |
| Actual Number of Meetings | `INT` |
| Met Quorum | `ENUM(0, 1)` |
| Submitted Meeting Minutes | `ENUM(0, 1)` |
| Submitted Council Updates | `ENUM(0, 1)` |
| Reason for No Meeting | `TEXT` |
| Reason for No Quorum | `TEXT` |
| Reason for No Meeting Minutes | `TEXT` |
| Reason for No Council Updates | `TEXT` |

The data is stored in a CSV, tabular, format.

## What visualizations are serviced?
