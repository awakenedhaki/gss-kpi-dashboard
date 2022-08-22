from enum import Enum

class MetQuorum(Enum):
    NO = 0
    YES = 1

class SubmittedMinutes(Enum):
    NO = 0
    YES = 1

class SubmittedCouncilUpdate(Enum):
    NO = 0
    YES = 1

class CompletedCouncilSubmission(Enum):
    NO = 0
    YES = 1

class ReasonNoQuorum(Enum):
    NO = 0
    YES = 1

class ReasonNoMeeting(Enum):
    NO = 0
    YES = 1

class ReasonNoMinutes(Enum):
    NO = 0
    YES = 1

class ReasonNoCouncilUpdate(Enum):
    NO = 0
    YES = 1

class CommitteeEntry(object):
    pass

if __name__ == '__main__':
    pass