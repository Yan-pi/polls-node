# Polls-Node Project Documentation

## Introduction

Polls-Node is an application for creating and voting on polls in real-time, using Fastify, Node.js, Redis, TypeScript, Docker, PostgreSQL, and WebSockets. This documentation describes the components, functionalities, and how to set up and use the application.

## Technologies Used

- **Fastify**: Web framework for building efficient APIs.
- **Node.js**: Execution environment for JavaScript.
- **Redis**: In-memory database for caching and storing user information.
- **TypeScript**: Typed superset of JavaScript.
- **Docker**: Platform for developing, shipping, and running applications in containers.
- **PostgreSQL**: Relational database management system.
- **Prisma**: ORM (Object-Relational Mapping) for interacting with the database.
- **WebSocket**: Bidirectional real-time communication protocol.

## Environment Setup

### Prerequisites

- Node.js and npm installed
- Docker and Docker Compose installed

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yan-pi/polls-node.git
   ```

2. Install the dependencies:
   ```bash
   cd polls-node
   pnpm install
   ```

3. Configure the environment variables:

   Create a `.env` file in the project root with the following variables:

   ```env
   DATABASE_URL="postgresql://<user>:<password>@localhost:5432/polls?schema=public"
   ```

   **Note**: Replace `<username>` and `<password>` with your PostgreSQL credentials.

4. Start the services with Docker Compose:
   ```bash
   docker-compose up -d
   ```

5. Running migrations
   ```bash
   npx prisma migrate dev
   ```
   This will run all migrations creating the tables and other configs inside the database.

## Project Structure

```
polls-node/
|-- src/
|   |-- http/
|   |   |-- poll.ts
|   |   |-- routes/
|   |   |    |-- create-poll.ts
|   |   |    |-- get-poll.ts
|   |   |    |-- vote-on-poll.ts
|   |-- ws/
|   |   |-- poll-results.ts
|   |-- index.ts
|-- .env
|-- docker-compose.yml
|-- tsconfig.json
```

## Features

### 1. Create Poll

- **Endpoint**: `POST /poll`
- **Description**: Creates a new poll in the PostgreSQL database.

#### Example Usage

```json
{
  "question": "What is your favorite animal?",
  "options": ["Dog", "Cat", "Fish"]
}
```

### 2. Get Poll

- **Endpoint**: `GET /polls/:pollId`
- **Description**: Retrieves the details of a specific poll.

### 3. Vote on Poll

- **Endpoint**: `POST /polls/:pollId/vote`
- **Description**: Records the user's vote on a poll and updates the results in real-time via WebSocket.

#### Example Usage

```json
{
  "option": "Dog"
}
```

### 4. WebSockets
- **Endpoint**: `WS /polls/:pollId/results`
- **Functionality**: Real-time update of poll results.
- **Implementation**: Utilizes WebSocket to send updated results to clients in real-time.

## Redis Login Cache

User login is stored in the Redis cache for authentication and authorization.

## ORM and Database

We use Prisma as the ORM for interacting with PostgreSQL. The database configuration is in the `prisma/schema.prisma` file.

## Execution

After setting up the environment, run the following command to start the server:

```bash
pnpm start
```

The server will be running on port `3333`.

## Conclusion

Polls-Node is a robust application for creating and voting on polls in real-time, using modern and efficient technologies. With a well-defined and documented architecture, it is easy to understand and extend its functionalities.