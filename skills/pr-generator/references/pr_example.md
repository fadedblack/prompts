# feat(api): add UserProfileController for managing user profiles

## 🔍 Summary
This PR introduces the `UserProfileController` to handle operations related to user profiles. It exposes endpoints for retrieving a profile by ID and updating profile details. This is part of the "User Dashboard" feature initiative.

## ✨ Key Changes
* **New Controller:** Added `UserProfileController.java` with the following endpoints:
  * `GET /api/v1/profiles/{id}` - Retrieves a user profile.
  * `PUT /api/v1/profiles/{id}` - Updates user profile details.
* **DTO Implementation:** Created `UserProfileResponseDTO` and `UpdateProfileRequestDTO` to decouple the API from the internal DB entities.
* **Service Layer:** Updated `UserService` to handle the logic for `updateProfile`, including validation for existing emails.
* **Error Handling:** Added `GlobalExceptionHandler` support for `UserNotFoundException`.

## ⚙️ API Contract

**GET** `/api/v1/profiles/{id}`

```json
{
  "id": 101,
  "username": "jdoe",
  "email": "jdoe@example.com",
  "bio": "Software Engineer"
}